// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/Themes/theme_controller.dart';
import 'Control/objectbox.dart';
import 'Pages/holder_page.dart';
import 'dart:async';
import 'package:theme_provider/theme_provider.dart';


late ObjectBox objectbox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  MainController().initAll();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Timetable ++',
        theme: ThemeController().apptheme,
        home: HolderPage(),
      ),
    );
  }
}


class MyAppState extends ChangeNotifier {}