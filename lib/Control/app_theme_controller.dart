// ignore_for_file: , prefer_final_fields, prefer_const_constructors, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Models/settingsbatch.dart';

class AppThemeController {
  AppThemeController._privateConstructor();

  static final AppThemeController _instance =
      AppThemeController._privateConstructor();
  factory AppThemeController() {
    return _instance;
  }

  late AppTheme _appTheme;

  initAppTheme() {
    String theme = SettingsController().getAppActiveTheme();
    try {
      debugPrint(
          '[AppThemeController]: initTheme(): Initializing the app with $theme theme');
      _appTheme = getAppThemeByName(theme);
    } catch (e) {
      debugPrint('[AppThemeController]: initTheme(): Something went wrong.');
      _appTheme = getAppThemes()[0];
    }
  }

  AppTheme getActiveTheme() {
    return _appTheme;
  }

  String getActiveThemeName() {
    return getActiveTheme().id;
  }

  void setAppTheme(String themeName) {
    debugPrint('[AppThemeController]: setAppTheme($themeName)');
    SettingsController().setAppActiveTheme(themeName);
    _appTheme = getAppThemeByName(themeName);
  }

  void setWidgetTheme(String themeName) {
    switch (themeName) {
      case 'light':
        debugPrint('[SetWidgetTheme]: Changed theme to light.');
        break;
      case 'dark':
        debugPrint('[SetWidgetTheme]: Changed theme to dark.');
        break;
      default:
        debugPrint('[setWidgetTheme]: Something went wrong.');
    }
  }

  String getWidgetThemeName(String themeName) {
    return SettingsController().getAppActiveTheme();
  }

  AppTheme getAppThemeByName(String name) {
    List<AppTheme> list = getAppThemes();
    for (var element in list) {
      if (element.id == name) {
        return element;
      }
    }
    debugPrint('getAppThemeByName: no matches found for $name');
    return list[0];
  }

  Brightness _isBright(bool isBright) {
    if (isBright) {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }

  AppTheme _appThemeFactory(String id, String description, bool isBright,
      Color primaryColor, Color secondaryColor) {



    return AppTheme(
      id: id,
      description: description,
      data: ThemeData(
          datePickerTheme: DatePickerThemeData(
            backgroundColor: isBright ? Colors.grey[200]! : Colors.grey[700],
            todayBackgroundColor: WidgetStatePropertyAll(secondaryColor),
            cancelButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(secondaryColor)),
            confirmButtonStyle: ButtonStyle(backgroundColor: WidgetStatePropertyAll(secondaryColor)),
            headerBackgroundColor: primaryColor,
            rangePickerBackgroundColor: secondaryColor, 
            rangePickerHeaderHeadlineStyle: TextStyle( color: isBright ? Colors.grey[100]! : Colors.grey[850]!,)
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: secondaryColor,
            elevation: 3,
            shadowColor: Colors.black,
          ),
          dividerTheme: DividerThemeData(
            color: isBright ? Colors.grey[100] : Colors.grey[900],
          ),
          cardTheme: CardTheme(color: primaryColor, elevation: 2),
          splashColor: primaryColor,
          colorScheme: ColorScheme(
              brightness: _isBright(isBright),
              primary: isBright ? Colors.grey[100]! : Colors.grey[850]!,
              onPrimary: primaryColor,
              secondary: secondaryColor,
              onSecondary: isBright ? Colors.grey[100]! : Colors.grey[850]!,
              error: Colors.redAccent,
              onError: Colors.black,
              surface: isBright ? Colors.grey[50]! : Colors.grey[900]!,
              onSurface: isBright ? Colors.black : Colors.white),
          textTheme: TextTheme(),
          useMaterial3: true),
    );
  }

  List<AppTheme> getAppThemes() {
    List<AppTheme> appThemes = [
      _appThemeFactory(
        'winter',
        'dark,deep purple, accent',
        false,
        Colors.deepPurple,
        Colors.blueAccent,
      ),
      _appThemeFactory(
        'autumn',
        'dark, light purple,gold',
        false,
        Colors.brown[500]!,
        Colors.orangeAccent[100]!,
      ),
      _appThemeFactory(
        'spring',
        'light, pink, brown',
        true,
        Colors.pink[100]!,
        Colors.brown,
      ),
      _appThemeFactory(
        'summer',
        'light, green, red',
        true,
        Colors.green[100]!,
        Colors.pinkAccent,
      ),
    ];
    return appThemes;
  }
}
