import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:flutter/material.dart';

import '../utils/layout.dart';
import 'layouts/home_page_large.dart';
import 'layouts/home_page_medium.dart';
import 'layouts/home_page_small.dart';

class HomePage extends StatelessWidget {
  final HomePageController homePageController;
  const HomePage({super.key, required this.homePageController});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: HomePageSmall(),
      medium: HomePageMedium(),
      large: HomePageLarge(),
    );
  }
}
