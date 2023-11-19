import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart';
import 'tab_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<SharedPreferences> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await initMRZSDK();
    return prefs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OCR Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1D1B20),
      ),
      home: FutureBuilder<SharedPreferences>(
        future: loadData(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(); // Loading indicator
          }
          return TabPage();
        },
      ),
    );
  }
}
