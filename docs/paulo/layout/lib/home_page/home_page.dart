import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../layout.dart';
import 'layouts/home_page_small.dart';
import 'layouts/home_page_medium.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: HomePageSmall(),
      medium: HomePageMedium(),
      big: HomePageSmall(),
    );
  }
}
