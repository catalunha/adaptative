import 'dart:developer';

import 'package:adaptative/pages/splash/controller/controllers.dart';
import 'package:adaptative/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SplashRoute {
  Widget page(BuildContext context) {
    log('SplashRoute.page');

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SplashPageController(),
        )
      ],
      builder: (context, child) => SplashPage(
        splashPageController: context.read<SplashPageController>(),
      ),
    );
  }
}

// class SplashRoute {
//   Widget page(BuildContext context) {
//     log('SplashRoute.page');

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<SplashPageController>(
//           create: (BuildContext context) => SplashPageController(),
//         )
//       ],
//       child: Builder(
//         builder: (context) {
//           return SplashPage(
//               splashPageController: context.read<SplashPageController>());
//         },
//       ),
//       // child: SplashPage(splashPageController: SplashPageController()),// gera rebuild
//       // child: const SplashPage2(),
//     );
//   }
// }
