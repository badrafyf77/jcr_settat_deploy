import 'package:flutter/material.dart';
import 'package:jcr_settat/responsive/mobile/widgets/m_t_appbar.dart';
import 'package:jcr_settat/responsive/mobile/widgets/drawer.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const MobileAppBar(),
        endDrawer: const MobileDrawer(),
        body: body,
      ),
    );
  }
}
