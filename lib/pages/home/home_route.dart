import 'dart:developer';

import 'package:flutter/material.dart';

import 'home_page.dart';

class HomeRoute {
  Widget page(BuildContext context) {
    log('HomeRoute.page');

    return const HomePage();
  }
}
