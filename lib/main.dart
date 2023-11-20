import 'package:adaptative/core/hive_db.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

import 'core/app_enviroment/controllers.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  // await Hive.openBox<String>(
  //   'box',
  // );
  final hiveDb = HiveDb();
  runApp(MyApp(hiveBox: await hiveDb.initBox()));
}

class MyApp extends StatelessWidget {
  final CollectionBox hiveBox;
  const MyApp({
    Key? key,
    required this.hiveBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => hiveBox,
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
