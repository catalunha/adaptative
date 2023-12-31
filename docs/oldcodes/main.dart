import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'package:adaptative/core/isar_db.dart';
import 'package:provider/provider.dart';

import 'core/app_enviroment/controllers.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isarDb = IsarDb();
  await isarDb.init();
  runApp(MyApp(isar: isarDb.database));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({
    Key? key,
    required this.isar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => isar,
        ),
        Provider(
          create: (context) => AppEnviromentCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Adaptative',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
