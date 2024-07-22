// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:timetablepp/Control/app_theme_controller.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'Control/objectbox.dart';
import 'Pages/holder_page.dart';
import 'dart:async';

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
    return ThemeProvider(
      //loadThemeOnInit: true,
      themes: AppThemeController().getAppThemes(),
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        AppThemeController().initAppTheme();
        controller.setTheme(AppThemeController().getActiveTheme().id);
      },
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Timetable++',
            home: const HolderPage(),
          ),
        ),
      ),
    );
  }

  /*return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Timetable ++',
        theme: AppThemeController().getTheme(),
        home: const HolderPage(),
      ),
    );*/
}

class MyAppState extends ChangeNotifier {}
