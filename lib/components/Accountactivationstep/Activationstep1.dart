import 'package:citizenapp/bloc/Activateocrcapturebloc/activateocrcapture_bloc.dart';
import 'package:citizenapp/components/Contentcininput.dart';
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
          } else if (state is ActivateocrcaptureOn) {
            return Ocrcapturehome();
          } else if (state is Activateocrbyfile) {
            return Text("Integrating ocr by file");
          } else if (state is Viewtipsstate) {
            return OcrScanGuide();
          } else {
            return Text("Not implemented state");
          }
        },
      ),
    );
  }
}
