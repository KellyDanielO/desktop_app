import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState extends StateNotifier<int> {
  CounterState() : super(0);
  void increment() {
    state++;
  }
}

class ThemeState extends StateNotifier<bool> {
  ThemeState() : super(false);
  void changeTheme(bool theme) {
    state = theme;
  }
}
