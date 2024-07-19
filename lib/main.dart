import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
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
      themes: [
        AppTheme.light(
            id: 'light'), // This is standard light theme (id is default_light_theme)
        AppTheme.dark(
            id: 'dark'), // This is standard dark theme (id is default_dark_theme)
        AppTheme(
          id: "custom_theme", // Id(or name) of the theme(Has to be unique)
          description: "My Custom Theme", // Description of theme
          data: ThemeData(
            // Real theme data
            primaryColor: Colors.black,
            hintColor: Colors.red,
          ),
        ),
      ],
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
