import 'package:desktop_app/state_andler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider<String>((ref) {
  return 'light';
});

// final themeModeProvider = StateNotifierProvider<ThemeState, String>((ref) {
//   return ThemeState();
// });

final isDarkModeProvider = StateNotifierProvider<ThemeState, bool>((ref) => ThemeState());