import 'package:flutter/material.dart';
import 'package:jcr_settat/features/partners/presentation/widgets/body.dart';
import 'package:jcr_settat/responsive/general_scaffold.dart';

class PartnersView extends StatelessWidget {
  const PartnersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isPartnersSelected: true,
      desktopBody: PartnersBody(),
      tabletBody: PartnersBody(),
      mobileBody: PartnersBody(
        isMobile: true,
      ),
    );
  }
}
