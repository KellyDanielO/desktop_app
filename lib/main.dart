import 'package:desktop_app/colors.dart';
import 'package:desktop_app/providers.dart';
import 'package:desktop_app/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';
import 'dashboard.dart';
import 'state_andler.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(isDarkModeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeMode ? AppTheme.dark : AppTheme.light,
      home: const DashBoardScreen(),
    );
  }
}
// ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
      
//         scaffoldBackgroundColor:
//             themeMode == 'light' ? AppColors.mainBgLight : AppColors.mainBgDark,
//         appBarTheme: AppBarTheme(
//           backgroundColor: themeMode == 'light'
//               ? AppColors.mainBgLight
//               : AppColors.mainBgDark,
//         ),
//       )
class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

final counterProvider =
    StateNotifierProvider<CounterState, int>((ref) => CounterState());

class _MyHomePageState extends ConsumerState<MyHomePage> {
  void _incrementCounter() {
    ref.read(counterProvider.notifier).increment();
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    // final themeMode = ref.watch(themeModeProvider);
    final themeMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(
            color: !themeMode 
                ? AppColors.mainColorLight
                : AppColors.mainColorDark,
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: !themeMode 
                    ? AppColors.mainColorLight
                    : AppColors.mainColorDark,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ));
              },
              child: Text(
                count.toString(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: !themeMode
                          ? AppColors.mainColorLight
                          : AppColors.mainColorDark,
                    ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
