import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

part 'activateocrcapture_event.dart';
part 'activateocrcapture_state.dart';

class ActivateocrcaptureBloc
    extends Bloc<ActivateocrcaptureEvent, ActivateocrcaptureState> {
  CameraController? cameraController;

  late final TextRecognizer textRecognizer;

  bool _isProcessingFrame = false;

  DateTime? _lastProcessedFrame;

  ActivateocrcaptureBloc() : super(ActivateocrcaptureOff()) {
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    on<ActivatecaptureMode>(_onActivateCaptureMode);

    on<Capturing>(_onCapturing);

    on<Capturebyfile>((event, emit) {
      emit(Activateocrbyfile());
    });

    on<Viewtips>((event, emit) {
      emit(Viewtipsstate());
    });
  }

  void _onActivateCaptureMode(
    ActivatecaptureMode event,
    Emitter<ActivateocrcaptureState> emit,
  ) {
    if (event.ismodeon) {
      emit(ActivateocrcaptureOn());
    } else {
      emit(ActivateocrcaptureOff());
    }
  }

  Future<void> _onCapturing(
    Capturing event,
    Emitter<ActivateocrcaptureState> emit,
  ) async {
    emit(ActivateocrcaptureLoading());

    try {
      if (cameraController != null && cameraController!.value.isInitialized) {
        await _startImageStream(emit);

        emit(ActivateocrcaptureScanning());

        return;
      }

      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        emit(ActivateocrcaptureError('Aucune caméra disponible.'));
        return;
      }

      final camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      cameraController = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.nv21
            : ImageFormatGroup.bgra8888,
      );

      await cameraController!.initialize();

      await _startImageStream(emit);

      emit(ActivateocrcaptureScanning());
    } catch (e) {
      debugPrint('CAMERA ERROR: $e');

      await cameraController?.dispose();
      cameraController = null;

      emit(ActivateocrcaptureError('Impossible d\'initialiser la caméra.'));
    }
  }

  Future<void> _startImageStream(Emitter<ActivateocrcaptureState> emit) async {
    final controller = cameraController;

    if (controller == null) {
      return;
    }

    if (controller.value.isStreamingImages) {
      return;
    }

    await controller.startImageStream((CameraImage image) async {
      if (_isProcessingFrame) {
        return;
      }

      final now = DateTime.now();

      if (_lastProcessedFrame != null &&
          now.difference(_lastProcessedFrame!).inMilliseconds < 500) {
        return;
      }

      _lastProcessedFrame = now;
      _isProcessingFrame = true;

      try {
        await _processCameraImage(image, emit);
      } finally {
        _isProcessingFrame = false;
      }
    });
  }

  Future<void> _processCameraImage(
    CameraImage image,
    Emitter<ActivateocrcaptureState> emit,
  ) async {
    final inputImage = _inputImageFromCameraImage(image);

    if (inputImage == null) {
      return;
    }

    final recognizedText = await textRecognizer.processImage(inputImage);

    if (recognizedText.text.isEmpty) {
      return;
    }

    debugPrint('OCR TEXT:\n${recognizedText.text}');

    // Arrêter le stream avant de passer en Success
    if (cameraController != null && cameraController!.value.isStreamingImages) {
      await cameraController!.stopImageStream();
    }

    emit(ActivateocrcaptureSuccess(recognizedText.text));
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final controller = cameraController;

    if (controller == null) {
      return null;
    }

    final camera = controller.description;

    final sensorOrientation = camera.sensorOrientation;

    const orientations = {
      DeviceOrientation.portraitUp: 0,
      DeviceOrientation.landscapeLeft: 90,
      DeviceOrientation.portraitDown: 180,
      DeviceOrientation.landscapeRight: 270,
    };

    var rotationCompensation = orientations[controller.value.deviceOrientation];

    if (rotationCompensation == null) {
      return null;
    }

    if (camera.lensDirection == CameraLensDirection.front) {
      rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
    } else {
      rotationCompensation =
          (sensorOrientation - rotationCompensation + 360) % 360;
    }

    final rotation = InputImageRotationValue.fromRawValue(rotationCompensation);

    if (rotation == null) {
      return null;
    }

    final format = InputImageFormatValue.fromRawValue(image.format.raw);

    if (format == null) {
      return null;
    }

    if (Platform.isAndroid && format != InputImageFormat.nv21) {
      return null;
    }

    if (Platform.isIOS && format != InputImageFormat.bgra8888) {
      return null;
    }

    if (image.planes.length != 1) {
      return null;
    }

    final plane = image.planes.first;

    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  @override
  Future<void> close() async {
    if (cameraController != null && cameraController!.value.isStreamingImages) {
      await cameraController!.stopImageStream();
    }

    await cameraController?.dispose();

    await textRecognizer.close();

    cameraController = null;

    return super.close();
  }
}
