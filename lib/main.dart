import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:jcr_settat/core/config/app_router.dart';
import 'package:jcr_settat/core/config/theme.dart';

void main() async {
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(const MyApp());
  // setupServiceLocator();
  // increaseVisits();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'JCR Settat',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      routerConfig: AppRouter.router,
    );
  }
}
