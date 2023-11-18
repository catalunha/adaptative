import 'dart:developer';

import 'package:adaptative/pages/splash/controller/controllers.dart';
import 'package:adaptative/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashRoute {
  Widget page(BuildContext context) {
    log('SplashRoute.page');

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SplashPageController(),
        )
      ],
      builder: (context, child) => SplashPage(
        splashPageController: context.read<SplashPageController>(),
      ),
    );
  }
}
