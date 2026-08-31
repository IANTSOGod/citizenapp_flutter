import 'package:citizenapp/bloc/Activateocrcapturebloc/activateocrcapture_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressCircle extends StatelessWidget {
  final double progress;
  final Color primary;

  const ProgressCircle({
    super.key,
    required this.progress,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ActivateocrcaptureBloc>().add(ActivatecaptureMode(true));
      },
      child: SizedBox(
        width: 64,
        height: 64,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Cercle de fond
            CircularProgressIndicator(
              value: 1,
              strokeWidth: 2,
              color: primary.withValues(alpha: 0.15),
            ),

            // Progression
            CircularProgressIndicator(
              value: progress,
              strokeWidth: 2,
              color: primary,
            ),

            // Pourcentage
            Text(
              '${(progress * 100).round()}%',
              style: TextStyle(
                color: primary,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
