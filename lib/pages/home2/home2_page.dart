import 'package:flutter/material.dart';

import '../utils/layout.dart';
import 'controller/controllers.dart';
import 'layouts/home2_page_large.dart';
import 'layouts/home2_page_medium.dart';
import 'layouts/home2_page_small.dart';

class Home2Page extends StatelessWidget {
  final Home2PageController homePageController;
  const Home2Page({super.key, required this.homePageController});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: Home2PageSmall(),
      medium: Home2PageMedium(),
      large: Home2PageLarge(),
    );
  }
}
