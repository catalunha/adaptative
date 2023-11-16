import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:adaptative/pages/home/layouts/home_page_large.dart';
import 'package:adaptative/pages/home/layouts/home_page_medium.dart';
import 'package:adaptative/pages/home/layouts/home_page_small.dart';
import 'package:adaptative/pages/utils/layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomePageController homePageController;
  const HomePage({
    super.key,
    required this.homePageController,
  });

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: HomePageSmall(),
      medium: HomePageMedium(),
      large: HomePageLarge(),
    );
  }
}
