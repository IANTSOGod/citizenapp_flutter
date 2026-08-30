import 'package:citizenapp/bloc/Activateocrcapturebloc/activateocrcapture_bloc.dart';
import 'package:citizenapp/components/Contentcininput.dart';
import 'package:citizenapp/components/Ocrcapturestage/OcrImagePicker.dart';
import 'package:citizenapp/components/Ocrcapturestage/OcrScanGuide.dart';
import 'package:citizenapp/components/Ocrcapturestage/OcrcaptureHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Activationstep1 extends StatelessWidget {
  const Activationstep1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<ActivateocrcaptureBloc, ActivateocrcaptureState>(
        builder: (context, state) {
          if (state is ActivateocrcaptureOff) {
            return Contentcininput();
          }

          if (state is ActivateocrcaptureOn ||
              state is ActivateocrcaptureLoading ||
              state is ActivateocrcaptureScanning) {
            return Ocrcapturehome();
          }

          if (state is Activateocrbyfile) {
            return OcrImagePickerCard();
          }

          if (state is Viewtipsstate) {
            return OcrScanGuide();
          }

          if (state is ActivateocrcaptureError) {
            return Center(
              child: Text(state.message, textAlign: TextAlign.center),
            );
          }

          if (state is ActivateocrcaptureSuccess) {
            return Center(child: Text('CIN détectée : ${state.cin}'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
