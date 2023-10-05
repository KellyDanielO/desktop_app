import 'package:desktop_app/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'providers.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final count = ref.watch(counterProvider);
    final themeMode = ref.watch(isDarkModeProvider);
    // final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:
              !themeMode ? AppColors.mainColorLight : AppColors.mainColorDark,
        ),
        title: Text(
          'Edit',
          style: TextStyle(
            color:
                !themeMode ? AppColors.mainColorLight : AppColors.mainColorDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (!themeMode) {
                ref.read(isDarkModeProvider.notifier).changeTheme(true);
              } else {
                ref.read(isDarkModeProvider.notifier).changeTheme(false);
              }
            },
            icon: Icon(
              themeMode ? Icons.dark_mode : Icons.light_mode,
              color: !themeMode
                  ? AppColors.mainColorLight
                  : AppColors.mainColorDark,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: !themeMode
                        ? AppColors.mainColorLight
                        : AppColors.mainColorDark,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Yes');
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: const Text(
                    'Dashboard',
                    style: TextStyle(
                      color: AppColors.mainColorDark,
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
