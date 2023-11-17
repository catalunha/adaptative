import 'package:adaptative/pages/home3/controller/controllers.dart';
import 'package:flutter/material.dart';

import '../utils/layout.dart';
import 'layouts/home3_page_large.dart';
import 'layouts/home3_page_medium.dart';
import 'layouts/home3_page_small.dart';

class Home3Page extends StatelessWidget {
  final TaskListController taskListController;
  const Home3Page({super.key, required this.taskListController});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      small: Home3PageSmall(),
      medium: Home3PageMedium(),
      large: Home3PageLarge(),
    );
  }
}
