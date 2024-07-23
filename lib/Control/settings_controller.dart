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

  int getWidgetActiveTheme() {
    int result = _settings.widgetActiveTheme;
    debugPrint('[SettingsController]: getWidgetActiveTheme: $result');
    return result;
  }

  void setWidgetActiveTheme(int theme) {
    _settings.widgetActiveTheme = theme;
    debugPrint('[SettingsController]: setWidgetActiveTheme: $theme');
    DatabaseController().setSettingsBatch(_settings);
  }

  bool getIsMondayActive() {
    bool result = _settings.isMondayActive;
    debugPrint('[SettingsController]: getIsMondayActive: $result');
    return result;
  }

  void setIsMondayActive(bool isMondayActive) {
    debugPrint('[SettingsController]: setIsMondayActive: $isMondayActive');
    _settings.isMondayActive = isMondayActive;
    DatabaseController().setSettingsBatch(_settings);
  }

  bool getIsTuesdayActive() {
    bool result = _settings.isTuesdayActive;
    debugPrint('[SettingsController]: getIsTuesdayActive: $result');
    return result;
  }

  void setIsTuesdayActive(bool isTuesdayActive) {
    debugPrint('[SettingsController]: setIsTuesdayActive: $isTuesdayActive');
    _settings.isTuesdayActive = isTuesdayActive;
    DatabaseController().setSettingsBatch(_settings);
  }

  bool getIsWednesdayActive() {
    bool result = _settings.isWednesdayActive;
    debugPrint('[SettingsController]: getIsWednesdayActive: $result');
    return result;
  }

  void setIsWednesdayActive(bool isWednesdayActive) {
    debugPrint('[SettingsController]: setWednesdayActive: $isWednesdayActive');
    _settings.isWednesdayActive = isWednesdayActive;
    DatabaseController().setSettingsBatch(_settings);
  }

  bool getIsThursdayActive() {
    bool result = _settings.isThursdayActive;
    debugPrint('[SettingsController]: isThursdayActive: $result');
    return result;
  }

  void setIsThursdayActive(bool isThursdayActive) {
    debugPrint('[SettingsController]: setThursdayActive: $isThursdayActive');
    _settings.isThursdayActive = isThursdayActive;
    DatabaseController().setSettingsBatch(_settings);
  }

  void setIsFridayActive(bool isFridayActive) {
    debugPrint('[SettingsController]: setFridayActive: $isFridayActive');
    _settings.isFridayActive = isFridayActive;
    DatabaseController().setSettingsBatch(_settings);
  }

  bool getIsFridayActive() {
    bool result = _settings.isFridayActive;
    debugPrint('[SettingsController]: isFridayActive: $result');
    return result;
  }

  void setIsSaturdayActive(bool isSaturdayActive) {
    debugPrint('[SettingsController]: setIsSaturdayActive: $isSaturdayActive');
    _settings.isSaturdayActive = isSaturdayActive;
    DatabaseController().setSettingsBatch(_settings);
  }

  bool getIsSaturdayActive() {
    bool result = _settings.isSaturdayActive;
    debugPrint('[SettingsController]: getIsSaturdayActive: $result');
    return result;
  }

  void setIsSundayActive(bool isSundayActive) {
    debugPrint('[SettingsController]: setSundayActive: $isSundayActive');
    _settings.isSundayActive = isSundayActive;
    DatabaseController().setSettingsBatch(_settings);
  }

  bool getIsSundayActive() {
    bool result = _settings.isSundayActive;
    debugPrint('[SettingsController]: isSundayActive: $result');
    return result;
  }

  void setFirstDayOfTheWeek(int firstDayOfTheWeek) {
    debugPrint('[SettingsController]: setFirstDayOfTheWeek: $firstDayOfTheWeek');
    if (firstDayOfTheWeek < 7) {
      _settings.firstDayOfTheWeek = firstDayOfTheWeek;
      DatabaseController().setSettingsBatch(_settings);
    } else {
      debugPrint('[SettingsController]: setFirstdayOfTheWeek: Something went wrong.');
    }
  }
  int getFirstDayOfTheWeek() {
    int result = _settings.firstDayOfTheWeek;
    debugPrint('[SettingsController]: getFirstDayOfTheWeek: $result');
    return result;
  }
  //GENERAL HASTA AQUÍ
  //NOTIFS AQUI
  bool getSendNotifsNextLesson(){
    bool result = _settings.sendNotifsNextLesson;
    debugPrint('[SettingsController]: getNotifsNextLesson: $result');
    return result;
  }
  void setSendNotifsNextLesson(bool sendNotifsNextLesson){
    debugPrint('[SettingsController]: setNotifsNextLesson: $sendNotifsNextLesson');
    _settings.sendNotifsNextLesson = sendNotifsNextLesson;
    DatabaseController().setSettingsBatch(_settings);
  }
  bool getSendNotifsNextHomework(){
    bool result = _settings.sendNotifsNextHomework;
    debugPrint('[SettingsController]: getNotifsNextLesson: $result');
    return result;
  }
  //NOTIFS HASTA AQUÍ
}
