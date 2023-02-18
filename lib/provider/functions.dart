import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:templete/db/isar/settings.dart';
import 'package:templete/db/isar_db.dart';

// final themeProvider = Provider<ThemeMode?>((ref) {
//   return ThemeMode.dark;
// });

enum theme {
  light,
  dark,
}

final themeProviderTest = StateProvider<bool?>((ref) {
  return null;
});

final themeProvider =
    NotifierProvider<ThemeNotifier, String>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<String> {
  @override
  String build() {
    return 'true';
  }

  void changeTheme(String value) {
    state = value;
  }
}

final settingsStreamProvider =
    StreamProvider((_) => db.settings.where().watch(fireImmediately: true));



// Future<void> saveThemedata() async {
//   final isar = await db;
// }
