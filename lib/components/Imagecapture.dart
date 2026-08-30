import 'package:camera/camera.dart';
import 'package:citizenapp/bloc/Activateocrcapturebloc/activateocrcapture_bloc.dart';
import 'package:citizenapp/components/CornerFramePainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Imagecapture extends StatelessWidget {
  final ShadColorScheme colors;

  const Imagecapture({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivateocrcaptureBloc, ActivateocrcaptureState>(
      builder: (context, state) {
        final bloc = context.read<ActivateocrcaptureBloc>();

        final controller = bloc.cameraController;

        final cameraReady =
            controller != null && controller.value.isInitialized;

        final showCamera =
            state is ActivateocrcaptureLoading ||
            state is ActivateocrcaptureScanning;

        return Center(
          child: AspectRatio(
            aspectRatio: 1.58,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Stack(
                children: [
                  // Preview caméra
                  Positioned.fill(
                    child: Container(
                      margin: const EdgeInsets.all(14),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: colors.muted,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: showCamera && cameraReady
                          ? CameraPreview(controller)
                          : const SizedBox(),
                    ),
                  ),

                  // Cadre de scan
                  Positioned.fill(
                    child: CustomPaint(
                      painter: CornerFramePainter(color: colors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
