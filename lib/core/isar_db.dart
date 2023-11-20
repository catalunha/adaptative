// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';

// import '../data/models/task.dart';

// class IsarDb {
//   late final Isar database;

//   Future<void> init() async {
//     final dir = await getApplicationDocumentsDirectory();
//     database = await Isar.open(
//       [
//         TaskSchema,
//       ],
//       directory: dir.path,
//       name: 'isardb',
//     );
//   }
// }
