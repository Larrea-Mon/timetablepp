// ignore_for_file: unused_import, prefer_final_fields, prefer_const_constructors

import 'dart:collection';
import 'dart:ffi';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/objectbox.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Control/Themes/app_theme_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/settingsbatch.dart';
import 'package:timetablepp/Models/termperiod.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/subject.dart';
import '../objectbox.g.dart';

import '../main.dart';

class MainController {
  MainController._privateConstructor();

  static final MainController _instance = MainController._privateConstructor();
  factory MainController() {
    return _instance;
  }
  Map<String, Color> subjectColorsMap = {};

  get getSubjectColorsMap => subjectColorsMap;

  set setSubjectColorsMap(subjectColorsMap) =>
      this.subjectColorsMap = subjectColorsMap;

  late TermPeriod _termPeriod;
  HolidayPeriod _currentHolidayPeriod = HolidayPeriod(null, null, '');
  Subject _currentSubject =
      Subject('New Subject', '', '', '', SubjectColors.sky.name);

  // TERM PERIODS -
  TermPeriod getTermPeriod() {
    var result = DatabaseController().getTermPeriod(1);
    _termPeriod = result;
    return _termPeriod;
  }

  late SettingsBatch settings;

  void setTermPeriodStart(DateTime start) {
    _termPeriod.start = start;
    DatabaseController().putTermPeriod(_termPeriod);
  }

  void setTermPeriodEnd(DateTime end) {
    _termPeriod.end = end;
    DatabaseController().putTermPeriod(_termPeriod);
  } // TERM PERIODS

  // CURRENT HOLIDAY
  HolidayPeriod getCurrentHoliday() {
    return _currentHolidayPeriod;
  }

  void setCurrentHoliday(HolidayPeriod holidayPeriod) {
    _currentHolidayPeriod = holidayPeriod;
  }

  void resetCurrentHoliday() {
    _currentHolidayPeriod.end = null;
    _currentHolidayPeriod.start = null;
    _currentHolidayPeriod.name = '';
  }

  void pushCurrentHoliday(String name) {
    _currentHolidayPeriod.setName(name);
    DatabaseController().putHolidayPeriod(getCurrentHoliday());
  }

  void deleteCurrentHoliday() {
    DatabaseController().removeHolidayPeriod(_currentHolidayPeriod.id);
  } //CURRENT HOLIDAY

  // CURRENT SUBJECT
  Subject getCurrentSubject() {
    return _currentSubject;
  }

  void setCurrentSubject(Subject subject) {
    debugPrint(
        '[MainController] : SetcurrentSubject(Antes era $_currentSubject y ahora va a ser $subject)');
    _currentSubject = subject;
    debugPrint(
        '[MainController] : SetcurrentSubject(TEST: _currentSubject es: $_currentSubject)');
  }

  void resetCurrentSubject() {
    _currentSubject =
        Subject('New Subject', '', '', '', SubjectColors.sky.name);
  }

  void pushCurrentSubject() {
    DatabaseController().putSubject(_currentSubject);
  }

  void deleteCurrentSubject() {
    DatabaseController().removeSubject(_currentSubject.id);
  }

  //CURRENT SUBJECT

  //SUBJECT DB
  editCurrentSubject(
      String name, String abv, String teacher, String place, String color) {
    _currentSubject.name = name;
    _currentSubject.abv = abv;
    _currentSubject.teacher = teacher;
    _currentSubject.place = place;
    _currentSubject.color = color;
  }

//SUBJECT DB
  void initColorsMap() {
    subjectColorsMap['sky'] = Colors.blue[200]!;
    subjectColorsMap['river'] = Colors.blue[700]!;
    subjectColorsMap['grass'] = Colors.green[200]!;
    subjectColorsMap['forest'] = Colors.green[700]!;
    subjectColorsMap['sun'] = Colors.yellow[600]!;
    subjectColorsMap['orange'] = Colors.orange[600]!;
    subjectColorsMap['pink'] = Colors.pink[300]!;
    subjectColorsMap['apple'] = Colors.red[600]!;
    subjectColorsMap['lila'] = Colors.purple[400]!;
    subjectColorsMap['purple'] = Colors.purple[600]!;
    subjectColorsMap['chocolate'] = Colors.brown[400]!;
    subjectColorsMap['wood'] = Colors.brown[700]!;
  }

  String? getNameForColor(Color color) {
    var orig = subjectColorsMap;
    var reversed =
        Map.fromEntries(orig.entries.map((e) => MapEntry(e.value, e.key)));
    return reversed[color];
  }

  Map<ColorSwatch<Object>, String> generateColorSwatchMap() {
    var result = <ColorSwatch<Object>, String>{
      //ColorTools.createPrimarySwatch(subjectColorsMap['sky']!) : 'sky',
    };
    for (var element in SubjectColors.values) {
      debugPrint(element.name);
      result[ColorTools.createPrimarySwatch(subjectColorsMap[element.name]!)] =
          element.name;
    }

    return result;
  }


  void initAll() {
    SettingsController().initSettings();
    initColorsMap();
    AppThemeController().initTheme();
  }
}

void todoButton() {
  Fluttertoast.showToast(
      msg: '//TODO implementar esto', backgroundColor: Colors.grey);
}
