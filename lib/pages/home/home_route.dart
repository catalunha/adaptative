import 'dart:developer';

import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class HomeRoute {
  Widget page(BuildContext context) {
    log('HomeRoute.page');

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HomePageController(),
        )
      ],
      builder: (context, child) => HomePage(
        homePageController: context.read<HomePageController>(),
      ),
    );
  }
}
