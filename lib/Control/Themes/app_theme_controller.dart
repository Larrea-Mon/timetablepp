// ignore_for_file: , prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
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
  ThemeData apptheme = ThemeData();

  int getThemeSetting() {
    SettingsBatch setting = DatabaseController().getSettingsBatch();
    int result = setting.appActiveTheme;
    return result;
  }

  getTheme() {
    debugPrint('ThemeController: getTheme()');
    return apptheme;
  }

  void initTheme() {
    debugPrint('ThemeController: initTheme()');
    switch (getThemeSetting()) {
      case 0:
        apptheme = ThemeData.light();
        break;
      case 1:
        apptheme = ThemeData.dark();
        break;
      default:
        apptheme = ThemeData.light();
        break;
    }
  }

  void setAppTheme(String themeName) {
    switch (themeName) {
      case 'light':
        debugPrint('[SetAppTheme]: Changed theme to light.');
        SettingsController().setActiveTheme(0);
        initTheme();
        break;
      case 'dark':
        debugPrint('[SetAppTheme]: Changed theme to dark.');
        SettingsController().setActiveTheme(1);
        initTheme();
        break;
      case 'system':
        debugPrint('[SetAppTheme]: Changed theme to system.');
        SettingsController().setActiveTheme(2);
        initTheme();
      default:
        debugPrint('[setAppTheme]:Something went wrong.');
    }
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
        debugPrint('[setWidgetTheme]Something went wrong.');
    }
  }
}
