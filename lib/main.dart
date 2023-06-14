import 'package:flutter/material.dart';
import 'package:wsr_xd/presentation/favorites_page.dart';
import 'package:wsr_xd/presentation/history_page.dart';
import 'package:wsr_xd/presentation/login_page.dart';
import 'package:wsr_xd/presentation/map_page.dart';
import 'package:wsr_xd/presentation/settings_page.dart';
import 'package:wsr_xd/presentation/timer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}