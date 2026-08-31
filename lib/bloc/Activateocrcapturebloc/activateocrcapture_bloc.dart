import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:citizenapp/Types/VerifyUsercincredentials.dart';
import 'package:citizenapp/utils/cinocrparser.dart';
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

  // Permet d'attendre que la caméra se stabilise
  bool _isStabilized = false;

  Timer? _stabilizationTimer;

  // Durée avant d'autoriser l'OCR
  static const Duration _stabilizationDuration = Duration(milliseconds: 1200);

  // Délai minimum entre deux OCR
  static const Duration _ocrInterval = Duration(milliseconds: 700);

  ActivateocrcaptureBloc() : super(ActivateocrcaptureOff()) {
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    on<ActivatecaptureMode>(_onActivateCaptureMode);
    on<Capturing>(_onCapturing);

    // NOUVEAU : traite le résultat OCR renvoyé via add(), avec un emit valide
    on<OcrRecognized>(_onOcrRecognized);

    on<Capturebyfile>((event, emit) {
      emit(Activateocrbyfile());
    });

    on<Viewtips>((event, emit) {
      emit(Viewtipsstate());
    });
  }

  // ---------------------------------------------------------------------------
  // MODE OCR
  // ---------------------------------------------------------------------------

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

  // ---------------------------------------------------------------------------
  // START CAMERA
  // ---------------------------------------------------------------------------

  Future<void> _onCapturing(
    Capturing event,
    Emitter<ActivateocrcaptureState> emit,
  ) async {
    emit(ActivateocrcaptureLoading());

    try {
      // Si la caméra existe déjà
      if (cameraController != null && cameraController!.value.isInitialized) {
        await _startImageStream();

        emit(ActivateocrcaptureScanning());
        return;
      }

      // Récupération des caméras
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        emit(ActivateocrcaptureError('Aucune caméra disponible.'));
        return;
      }

      // On privilégie la caméra arrière
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

      // Initialisation
      await cameraController!.initialize();

      // Démarrage du stream
      await _startImageStream();

      emit(ActivateocrcaptureScanning());
    } catch (e) {
      debugPrint('CAMERA ERROR: $e');

      _stabilizationTimer?.cancel();

      await cameraController?.dispose();

      cameraController = null;

      emit(ActivateocrcaptureError('Impossible d\'initialiser la caméra.'));
    }
  }

  // ---------------------------------------------------------------------------
  // RESULTAT OCR (déclenché via add(OcrRecognized(...)))
  // ---------------------------------------------------------------------------
  //
  // C'est ICI, et seulement ici, qu'on arrête le stream caméra et qu'on émet
  // le succès. Ce handler tourne dans son propre cycle de vie bloc, donc
  // `emit` y est toujours valide, contrairement à un emit appelé depuis le
  // callback de startImageStream une fois que _onCapturing est terminé.
  // ---------------------------------------------------------------------------

  Future<void> _onOcrRecognized(
    OcrRecognized event,
    Emitter<ActivateocrcaptureState> emit,
  ) async {
    if (cameraController != null && cameraController!.value.isStreamingImages) {
      await cameraController!.stopImageStream();
    }

    _stabilizationTimer?.cancel();
    _isStabilized = false;

    emit(ActivateocrcaptureSuccess(event.user));
  }

  // ---------------------------------------------------------------------------
  // IMAGE STREAM
  // ---------------------------------------------------------------------------

  Future<void> _startImageStream() async {
    final controller = cameraController;

    if (controller == null) {
      return;
    }

    if (controller.value.isStreamingImages) {
      return;
    }

    // Reset
    _isStabilized = false;
    _isProcessingFrame = false;
    _lastProcessedFrame = null;

    // Annule un éventuel ancien timer
    _stabilizationTimer?.cancel();

    debugPrint('CAMERA: stabilisation en cours...');

    // -------------------------------------------------------------------------
    // ATTENTE DE STABILISATION
    // -------------------------------------------------------------------------

    _stabilizationTimer = Timer(_stabilizationDuration, () {
      _isStabilized = true;

      debugPrint('CAMERA: stabilisée, OCR autorisé.');
    });

    // -------------------------------------------------------------------------
    // STREAM
    // -------------------------------------------------------------------------

    await controller.startImageStream((CameraImage image) async {
      // ---------------------------------------------------------------
      // Pendant la stabilisation, on ne fait aucun OCR.
      // ---------------------------------------------------------------

      if (!_isStabilized) {
        return;
      }

      // ---------------------------------------------------------------
      // Évite plusieurs traitements simultanés.
      // ---------------------------------------------------------------

      if (_isProcessingFrame) {
        return;
      }

      // ---------------------------------------------------------------
      // Évite de lancer OCR trop souvent.
      // ---------------------------------------------------------------

      final now = DateTime.now();

      if (_lastProcessedFrame != null &&
          now.difference(_lastProcessedFrame!).compareTo(_ocrInterval) < 0) {
        return;
      }

      _lastProcessedFrame = now;

      _isProcessingFrame = true;

      try {
        await _processCameraImage(image);
      } catch (e) {
        debugPrint('OCR ERROR: $e');
      } finally {
        _isProcessingFrame = false;
      }
    });
  }

  // ---------------------------------------------------------------------------
  // OCR
  // ---------------------------------------------------------------------------
  //
  // Ne fait plus AUCUN emit(). Se contente de add() un événement interne
  // une fois le résultat OCR prêt ; c'est _onOcrRecognized qui emit().
  // ---------------------------------------------------------------------------

  Future<void> _processCameraImage(CameraImage image) async {
    final inputImage = _inputImageFromCameraImage(image);

    if (inputImage == null) {
      return;
    }

    debugPrint('OCR: traitement de la frame...');

    final recognizedText = await textRecognizer.processImage(inputImage);

    // Aucun texte
    if (recognizedText.text.trim().isEmpty) {
      debugPrint('OCR: aucun texte détecté.');
      return;
    }

    debugPrint('OCR TEXT:\n${recognizedText.text}');

    // -------------------------------------------------------------------------
    // PARSER LA CIN
    // -------------------------------------------------------------------------

    final ocrData = CinOcrParser.parse(recognizedText.text);

    if (ocrData == null) {
      debugPrint('OCR: impossible d\'extraire les données de la CIN.');

      return;
    }

    // -------------------------------------------------------------------------
    // DONNEES OCR
    // -------------------------------------------------------------------------

    debugPrint('================================');
    debugPrint('CIN OCR');
    debugPrint('Nom       : ${ocrData.nom}');
    debugPrint('Prenom    : ${ocrData.prenom}');
    debugPrint('Date      : ${ocrData.date_naiss}');
    debugPrint('Lieu      : ${ocrData.lieu_de_naiss}');
    debugPrint('Num CIN   : ${ocrData.num_cin}');
    debugPrint('================================');

    // -------------------------------------------------------------------------
    // SEXE
    // -------------------------------------------------------------------------
    //
    // Le sexe ne vient PAS de l'OCR.
    //
    // Ici il faudrait récupérer le sexe depuis ton backend/session.
    //
    // Exemple temporaire :
    //

    const sexeBackend = 'Homme';

    // -------------------------------------------------------------------------
    // CREATION DE L'OBJET FINAL
    // -------------------------------------------------------------------------

    final user = Verifyusercincredentials(
      ocrData.nom,
      ocrData.prenom,
      ocrData.date_naiss,
      ocrData.lieu_de_naiss,
      sexeBackend,
      ocrData.num_cin,
    );

    // -------------------------------------------------------------------------
    // ENVOI DU RESULTAT VERS LE BLOC (au lieu d'un emit direct ici)
    // -------------------------------------------------------------------------

    add(OcrRecognized(user));
  }

  // ---------------------------------------------------------------------------
  // CAMERA IMAGE -> ML KIT INPUT IMAGE
  // ---------------------------------------------------------------------------

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final controller = cameraController;

    if (controller == null) {
      return null;
    }

    final camera = controller.description;

    final sensorOrientation = camera.sensorOrientation;

    // Orientation de l'appareil
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

    // -------------------------------------------------------------------------
    // FRONT CAMERA
    // -------------------------------------------------------------------------

    if (camera.lensDirection == CameraLensDirection.front) {
      rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
    } else {
      // -----------------------------------------------------------------------
      // BACK CAMERA
      // -----------------------------------------------------------------------

      rotationCompensation =
          (sensorOrientation - rotationCompensation + 360) % 360;
    }

    final rotation = InputImageRotationValue.fromRawValue(rotationCompensation);

    if (rotation == null) {
      return null;
    }

    // -------------------------------------------------------------------------
    // IMAGE FORMAT
    // -------------------------------------------------------------------------

    final format = InputImageFormatValue.fromRawValue(image.format.raw);

    if (format == null) {
      return null;
    }

    // -------------------------------------------------------------------------
    // ANDROID
    // -------------------------------------------------------------------------

    if (Platform.isAndroid && format != InputImageFormat.nv21) {
      debugPrint('Unsupported Android format: $format');

      return null;
    }

    // -------------------------------------------------------------------------
    // IOS
    // -------------------------------------------------------------------------

    if (Platform.isIOS && format != InputImageFormat.bgra8888) {
      debugPrint('Unsupported iOS format: $format');

      return null;
    }

    // -------------------------------------------------------------------------
    // ML KIT ATTEND UNE SEULE PLANE
    // -------------------------------------------------------------------------

    if (image.planes.length != 1) {
      debugPrint('Invalid planes count: ${image.planes.length}');

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

  // ---------------------------------------------------------------------------
  // CLOSE
  // ---------------------------------------------------------------------------

  @override
  Future<void> close() async {
    debugPrint('OCR CAMERA: fermeture...');

    _stabilizationTimer?.cancel();

    _stabilizationTimer = null;

    _isStabilized = false;

    if (cameraController != null && cameraController!.value.isStreamingImages) {
      await cameraController!.stopImageStream();
    }

    await cameraController?.dispose();

    cameraController = null;

    await textRecognizer.close();

    return super.close();
  }
}
