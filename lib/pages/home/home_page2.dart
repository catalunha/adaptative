import 'dart:developer';

import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:adaptative/pages/home/layouts/home_page_large.dart';
import 'package:adaptative/pages/home/layouts/home_page_medium.dart';
import 'package:adaptative/pages/home/layouts/home_page_small.dart';
import 'package:adaptative/pages/utils/layout.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log('HomePage2.build');
    return const Layout(
      small: HomePageSmall(),
      medium: HomePageMedium(),
      large: HomePageLarge(),
    );
  }
}
