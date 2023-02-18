import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id? id;

  String? theme;

  bool isDark = false;

  Settings({required this.theme, this.id, required this.isDark});
}
