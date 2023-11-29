import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HiveDb {
  Future<CollectionBox> initBox() async {
    String? path;
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      path = dir.path;
    }
    final collection = await BoxCollection.open(
      'adaptativedb', // Name of your database
      {'tasks'}, // Names of your boxes
      path: path,
    );
    final collectionBox = collection.openBox<Map>('tasks');

    return collectionBox;
  }
}

// class HiveDb {
//   Future<Box<String>> initBox() async {
//     final dir = await getApplicationDocumentsDirectory();
//     // await Hive.initFlutter(dir.path);
//     final box = Hive.box<String>(
//       'box',
//       // path: dir.path,
//     );
//     return box;
//   }
// }
