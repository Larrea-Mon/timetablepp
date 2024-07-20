// ignore_for_file: , prefer_final_fields, prefer_const_constructors, unused_import

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

  initTheme(){
    String theme = SettingsController().getActiveTheme();
    try {
      debugPrint('[AppThemeController]: initTheme(): Initializing the app with $theme theme');
      _appTheme = getAppThemeByName(theme);
    } catch (e) {
      debugPrint('[AppThemeController]: initTheme(): Something went wrong.');
      _appTheme =getAppThemes()[0];
    }
    

  }
  AppTheme getActiveTheme() {
    return _appTheme;
  }
  String getActiveThemeName(){
    return getActiveTheme().id;
  }
  void setAppTheme(String themeName){
    debugPrint('[AppThemeController]: setAppTheme($themeName)');
   SettingsController().setActiveTheme(themeName);
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
  AppTheme getAppThemeByName(String name){
    List<AppTheme> list = getAppThemes();
    for (var element in list) {
      if (element.id == name) {
        return element;
      }      
    }
    debugPrint('getAppThemeByName: no matches found for $name');
    return list[0];
  }
  List<AppTheme> appThemes = [
      AppTheme(
        id: 'winter',
        description: 'Black and blue theme',
        data: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
          textTheme: const TextTheme().apply(bodyColor: Colors.white),
        ),
      ),
      AppTheme(
        id: 'autumn',
        description: 'black and brown theme',
        data: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.black,
         appBarTheme: AppBarTheme(backgroundColor: Colors.brown),
          textTheme: const TextTheme().apply(bodyColor: Colors.white),
        ),
      ),
      AppTheme(
        id: 'spring',
        description: 'white and pink theme',
        data: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.pink),
          textTheme: const TextTheme().apply(bodyColor: Colors.black),
        ),
      ),
      AppTheme(
        id: 'summer',
        description: 'white and green theme',
        data: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.white,
         appBarTheme: AppBarTheme(backgroundColor: Colors.greenAccent),
          textTheme: const TextTheme().apply(bodyColor: Colors.black),
        ),
      )
    ];
  List<AppTheme> getAppThemes() {
    return appThemes;
  }

  
}
