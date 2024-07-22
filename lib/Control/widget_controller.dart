// ignore_for_file: , prefer_final_fields, prefer_const_constructors, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Models/settingsbatch.dart';

class WidgetController {
  WidgetController._privateConstructor();

  static final WidgetController _instance =
      WidgetController._privateConstructor();
  factory WidgetController() {
    return _instance;
  }

  late int _widgetTheme;

  initWidgetTheme(){
    _widgetTheme = SettingsController().getWidgetActiveTheme();
  }
  String getWidgetTheme(){
    if (_widgetTheme == 0) {
      return 'Light';
    } else {
      return 'Dark';
    }
  }
  void setWidgetTheme(int theme){
    _widgetTheme = theme;
    SettingsController().setWidgetActiveTheme(theme);
  }
}