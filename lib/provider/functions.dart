import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final themeProvider = Provider<ThemeMode?>((ref) {
//   return ThemeMode.dark;
// });

enum theme {
  light,
  dark,
}

final themeProvider =
    NotifierProvider<ThemeNotifier, String>(ThemeNotifier.new);

final ThemeProviderTest = StateProvider<bool>((ref) {
  return true;
});

class ThemeNotifier extends Notifier<String> {
  @override
  String build() {
    return 'hello';
  }

  void changeTheme() {
    state = 'dark';
  }
}
