import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.small,
    required this.medium,
    required this.big,
  });

  final Widget small;
  final Widget medium;
  final Widget big;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (child, constraints) {
        if (constraints.maxWidth < 350) return small;
        if (constraints.maxWidth < 600) return medium;
        return big;
      },
    );
  }
}
