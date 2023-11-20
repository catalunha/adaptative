import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveDb {
  Future<Box> initBox() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    final box = await Hive.openBox(
      'box',
    );
    return box;
  }
}
