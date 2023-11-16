import 'dart:developer';

import 'package:adaptative/pages/splash/controller/controllers.dart';
import 'package:adaptative/pages/splash/layouts/splash_page_large.dart';
import 'package:adaptative/pages/splash/layouts/splash_page_medium.dart';
import 'package:adaptative/pages/splash/layouts/splash_page_small.dart';
import 'package:adaptative/pages/utils/layout.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final SplashPageController splashPageController;
  const SplashPage({
    super.key,
    required this.splashPageController,
  });

  @override
  Widget build(BuildContext context) {
    log('SplashPage.build');
    return const Layout(
      small: SplashPageSmall(),
      medium: SplashPageMedium(),
      large: SplashPageLarge(),
    );
  }
}
