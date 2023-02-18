import 'package:isar/isar.dart';
import 'package:templete/db/isar/settings.dart';

// class IsarService {
//   late Future<Isar> db;

//   Future<Isar> openDB() async {
//     if (Isar.instanceNames.isEmpty) {
//       return await Isar.open([SettingsSchema], inspector: true);
//     }
//     throw UnimplementedError();
//   }

//   Future<Isar?> createTheme(Settings test) async {
//     final isar = await Isar.open([SettingsSchema]);

//     await isar.writeTxn(() async {
//       await isar.settings.put(test); // insert & update
//     });

//     return null;
//   }
// }
