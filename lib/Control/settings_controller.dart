// ignore_for_file: unused_import, prefer_final_fields, prefer_const_constructors

import 'dart:collection';
import 'dart:ffi';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/objectbox.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/settingsbatch.dart';
import 'package:timetablepp/Models/termperiod.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/subject.dart';
import '../objectbox.g.dart';

import '../main.dart';

class SettingsController {
  SettingsController._privateConstructor();

  static final SettingsController _instance =
      SettingsController._privateConstructor();
  factory SettingsController() {
    return _instance;
  }
  late SettingsBatch _settings;
  initSettings() {
    _settings = DatabaseController().getSettingsBatch();
  }

  SettingsBatch getAllSettings() {
    initSettings();
    return _settings;
  }

  String getAppActiveTheme() {
    String result = _settings.appActiveTheme;
    debugPrint('[SettingsController]: getAppActiveTheme: result = $result');
    return result;
  }
  void setAppActiveTheme(String theme) {
    _settings.appActiveTheme = theme;
    debugPrint('[SettingsController]: setAppActiveTheme: theme = $theme');
    DatabaseController().setSettingsBatch(_settings);
  }
  int getWidgetActiveTheme(){
    int result = _settings.widgetActiveTheme;
    debugPrint('[SettingsController]: getWidgetActiveTheme: $result');
    return result;
  }
  void setWidgetActiveTheme(int theme){
    _settings.widgetActiveTheme = theme;
    debugPrint('[SettingsController]: setWidgetActiveTheme: $theme');
    DatabaseController().setSettingsBatch(_settings);
  }

  getIsMondayActive() {}
  setIsModayActive() {}
  setIsTuesdayActive() {}
  getIsWednesdayActive() {}
  setIsWednesdayActive() {}
  getIsThursdayActive() {}
  setIsFridayActive() {}
  getIsFridayActive() {}
  setIsSaturdayActive() {}
  getIsSaturdayActive() {}
  setIsSundayActive() {}
  getIsSundayActive() {}
  setFirstDayOfTheWeek() {}
  getFirstDayOfTheWeek() {}
  //TODO continuar con el settings controller cuando sea relevante
}
