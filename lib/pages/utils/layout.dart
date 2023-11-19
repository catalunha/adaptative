import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_enviroment/controllers.dart';
import '../../core/app_enviroment/states.dart';

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
    final appEnv = context.read<AppEnviromentCubit>();
    return Builder(
      builder: (context) {
        log('Layout.build');
        final maxWidth = MediaQuery.of(context).size.width;
        log('mediaWidth: $maxWidth');
        appEnv.setMaxWidth(maxWidth);
        if (maxWidth < 600) {
          appEnv.setLayoutSize(LayoutSize.small);
          return small;
        }
        if (maxWidth < 900) {
          appEnv.setLayoutSize(LayoutSize.medium);

          return medium;
        }
        appEnv.setLayoutSize(LayoutSize.large);

        return large;
      },
    );
  }
  //   @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       log('Layout.build');
  //       log('constraints.maxWidth: ${constraints.maxWidth}');
  //       final mediaWidth = MediaQuery.of(context).size.width;
  //       log('mediaWidth: $mediaWidth');
  //       if (constraints.maxWidth < 600) {
  //         return small;
  //       }
  //       if (constraints.maxWidth < 900) {
  //         return medium;
  //       }
  //       return large;
  //     },
  //   );
  // }
}
