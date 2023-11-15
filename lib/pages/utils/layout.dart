import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget small;
  final Widget medium;
  final Widget large;

  const Layout({
    super.key,
    required this.small,
    required this.medium,
    required this.large,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print('constraints.maxWidth: ${constraints.maxWidth}');
        if (constraints.maxWidth < 350) {
          return small;
        }
        if (constraints.maxWidth < 600) {
          return medium;
        }
        return large;
      },
    );
  }
}
