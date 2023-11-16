import 'package:adaptative/pages/home/controller/controllers.dart';
import 'package:adaptative/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRoute {
  Widget page(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageController>(
          create: (BuildContext context) => HomePageController(),
        )
      ],
      child: HomePage(homePageController: HomePageController()),
    );
  }
}
