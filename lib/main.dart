import 'package:flutter/material.dart';
import 'package:making_http_request/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme:  ColorScheme(brightness: Brightness.light,
            primary: Colors.lightBlueAccent, onPrimary: Colors.white,
            secondary: Colors.lightBlue, onSecondary: Colors.white,
            error: Colors.redAccent, onError: Colors.redAccent,
            background: Colors.white, onBackground: Colors.white,
            surface: Colors.cyan.shade50, onSurface: Colors.cyan.shade100)
      ),
      home: const HomePage(),
    );
  }
}
