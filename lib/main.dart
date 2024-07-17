// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/theme_controller.dart';
import 'Control/objectbox.dart';
import 'Pages/holder_page.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late ObjectBox objectbox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  MainController().initAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Timetable ++',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeController().getThemeMode(),
        home: HolderPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}
