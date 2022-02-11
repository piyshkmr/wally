import 'package:flutter/material.dart';
import 'package:wally/screens/fullscreen.dart';
import 'package:wally/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        "fullscreen": (context) => const FullScreen(),
      },
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.red,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.black),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey[900],
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.black, elevation: 0.0)),
      themeMode: ThemeMode.dark,
    );
  }
}
