// ignore_for_file: unused_import, prefer_final_fields, prefer_const_constructors

import 'dart:collection';
import 'dart:ffi';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/objectbox.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/settingsbatch.dart';
import 'package:timetablepp/Models/termperiod.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../Models/subject.dart';
import '../../objectbox.g.dart';

import '../../main.dart';

class ThemeController {
  ThemeController._privateConstructor();

  static final ThemeController _instance =
      ThemeController._privateConstructor();
  factory ThemeController() {
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
