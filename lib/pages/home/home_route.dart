import 'dart:developer';

import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:adaptative/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'home_page2.dart';

// class HomeRoute {
//   Widget page(BuildContext context) {
//     log('HomeRoute.page');

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<HomePageController>(
//           create: (BuildContext context2) => HomePageController(),
//         )
//       ],
//       child: HomePage(homePageController: context.read<HomePageController>()),
//       // child: HomePage(homePageController: HomePageController()),
//       // child: const HomePage2(),
//     );
//   }
// }

class HomeRoute {
  Widget page(BuildContext context) {
    log('HomeRoute.page');

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HomePageController(),
        )
      ],
      builder: (context, child) =>
          HomePage(homePageController: context.read<HomePageController>()),
    );
  }
}
