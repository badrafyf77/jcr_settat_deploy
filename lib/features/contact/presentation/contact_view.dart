import 'package:flutter/material.dart';
import 'package:jcr_settat/features/contact/presentation/widgets/body.dart';
import 'package:jcr_settat/responsive/general_scaffold.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      desktopBody: ContactBody(),
      tabletBody: ContactBody(),
      mobileBody: ContactBody(
        isMobile: true,
      ),
    );
  }
}
