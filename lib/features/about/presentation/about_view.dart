import 'package:flutter/material.dart';
import 'package:jcr_settat/features/about/presentation/widgets/body.dart';
import 'package:jcr_settat/responsive/general_scaffold.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isAboutSelected: true,
      desktopBody: AboutBody(),
      tabletBody: AboutBody(),
      mobileBody: AboutBody(
        isMobile: true,
      ),
    );
  }
}
