import 'dart:developer';

import 'package:adaptative/pages/utils/layout.dart';
import 'package:flutter/material.dart';

import 'layouts/home_page_unique.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log('HomePage.build');
    return const Layout(
      small: HomePageUnique(),
      medium: HomePageUnique(),
      large: HomePageUnique(),
    );
  }
}
