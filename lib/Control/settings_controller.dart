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

  void pushSettings() {
    DatabaseController().setSettingsBatch(_settings);
  }

// CONTROL ACABA AQUI
// GENERAL EMPIEZA AQUI
  String getAppActiveTheme() {
    String result = _settings.appActiveTheme;
    debugPrint('[SettingsController]: getAppActiveTheme: result = $result');
    return result;
  }

  void setAppActiveTheme(String theme) {
    _settings.appActiveTheme = theme;
    debugPrint('[SettingsController]: setAppActiveTheme: theme = $theme');
    pushSettings();
  }

  int getWidgetActiveTheme() {
    int result = _settings.widgetActiveTheme;
    debugPrint('[SettingsController]: getWidgetActiveTheme: $result');
    return result;
  }

  void setWidgetActiveTheme(int theme) {
    _settings.widgetActiveTheme = theme;
    debugPrint('[SettingsController]: setWidgetActiveTheme: $theme');
    pushSettings();
  }

  //GENERAL HASTA AQUÍ
  //NOTIFS AQUI
  bool getSendNotifsNextLesson() {
    bool result = _settings.sendNotifsNextLesson;
    debugPrint('[SettingsController]: getNotifsNextLesson: $result');
    return result;
  }

  void setSendNotifsNextLesson(bool sendNotifsNextLesson) {
    debugPrint(
        '[SettingsController]: setNotifsNextLesson: $sendNotifsNextLesson');
    _settings.sendNotifsNextLesson = sendNotifsNextLesson;
    pushSettings();
  }

  int getTimeSendNotifsNextLesson() {
    int result = _settings.timeSendNotifsNextLesson;
    debugPrint('[SettingsController]: getTimeSendNotifsNextLesson: $result');
    return result;
  }

  void setTimeSendNotifsNextLesson(int minutes) {
    debugPrint('[SettingsController]: setTimeSendNotifsNextLesson: $minutes');
    _settings.timeSendNotifsNextLesson = minutes;
    pushSettings();
  }

  bool getSendNotifsNextHomework() {
    bool result = _settings.sendNotifsNextHomework;
    debugPrint('[SettingsController]: getNotifsNextLesson: $result');
    return result;
  }

  void setSendNotifsNextHomework(bool sendNotifsNextHomework) {
    _settings.sendNotifsNextHomework = sendNotifsNextHomework;
    debugPrint(
        '[SettingsController]: setSendNotifsNextHomework: $sendNotifsNextHomework');
    pushSettings();
  }

  int getTimeSendNotifsHomeworkAfterClass() {
    int result = _settings.timeSendNotifsHomeworkAfterClass;
    debugPrint('[SettingsController]: getNotifsNextLesson: $result');
    return result;
  }

  void setTimeSendNotifsHomeworkAfterClass(
      int timeSendNotifsHomeworkAfterClass) {
    _settings.timeSendNotifsHomeworkAfterClass =
        timeSendNotifsHomeworkAfterClass;
    debugPrint(
        '[SettingsController:] setTimeSendNotifsHomeworkAfterClass: ${timeSendNotifsHomeworkAfterClass.toString()}');
    pushSettings();
  }

  void setTimeNotifsHomeworkFreeDays(TimeOfDay time) {
    //ESTA ES UNICA Y DIFERENTE
    _settings.timeSendNotifsHomeworkFreeDaysHour = time.hour;
    _settings.timeSendNotifsHomeworkFreeDaysMinute = time.minute;
    debugPrint(
        '[SettingsController]: setTimeNotifsHomeworkFreeDays: hour: ${time.hour}, minute: ${time.minute}');
    pushSettings();
  }

  TimeOfDay getTimeNotifsHomeworkFreeDays() {
    //ESTA TAMBIEN ES UNICA
    TimeOfDay time = TimeOfDay(
        hour: _settings.timeSendNotifsHomeworkFreeDaysHour,
        minute: _settings.timeSendNotifsHomeworkFreeDaysMinute);
    debugPrint(
        '[SettingsController]: getTimeNotifsHomeworkFreeDays: hour: ${time.hour}, minute: ${time.minute}');
    return time;
  }

  int getDaysSendNotifsNextHomework() {
    int result = _settings.daysSendNotifsNextHomework;
    debugPrint('[SettingsController]: getDaysSendNotifsNextHomework: $result');
    return result;
  }

  void setDaysSendNotifsNextHomework(int days) {
    _settings.daysSendNotifsNextHomework = days;
    debugPrint('[SettingsController]: setDaysSendNotifsNextHomework: $days');
    pushSettings();
  }

  void setSendNotifsNextExam(bool sendNotifsNextExam) {
    _settings.sendNotifsNextExam = sendNotifsNextExam;
    debugPrint(
        '[SettingsController]: setSendNotifsNextExam: $sendNotifsNextExam');
    pushSettings();
  }

  bool getSendNotifsNextExam() {
    bool result = _settings.sendNotifsNextExam;
    debugPrint('[SettingsController]: getDaysSendNotifsNextExam: $result');
    return result;
  }

  int getDaysSendNotifsNextExam() {
    int result = _settings.daysSendNotifsNextExam;
    debugPrint('[SettingsController]: getDaysSendNotifsNextExam: $result');
    return result;
  }

  void setDaysSendNotifsNextExam(int days) {
    _settings.daysSendNotifsNextExam = days;
    debugPrint('[SettingsController]: setDaysSendNotifsNextExam');
    pushSettings();
  }

  //NOTIFS HASTA AQUÍ
  //AQUÍ EL SILENCIO AUTOMÁTICO
  void setEnableAutoSilence(bool enableAutoSilence) {
    _settings.enableAutoSilence = enableAutoSilence;
    debugPrint('EnableAutoSilence');
    pushSettings();
  }

  bool getEnableAutoSIlence() {
    bool result = _settings.enableAutoSilence;
    debugPrint('[SettingsController]: getEnableAutoSIlence: $result');
    return result;
  }

  void setMinutesAutoSilence(int mins) {
    _settings.minutesAutosilence = mins;
    debugPrint('[SettingsController]: setMinutesAutoSilence: $mins');
    pushSettings();
  }

  int getMinutesAutoSilence() {
    int result = _settings.minutesAutosilence;
    debugPrint('[SettingsController]:getMinutesAutoSilence: $result');
    return result;
  }

  //SILENCIO AUTOMATICO HASTA AQUÍ
  //HORARIO EMPIEZA AQUI
  int getWeekviewStartTime(){
    int result = _settings.weekviewStartTime;
    debugPrint('[SettingsController]:getWeekviewStartTime: $result');
    return result;
  }
  void setWeekviewStartTime(int startTime){
    _settings.weekviewStartTime = startTime;
    debugPrint('[SettingsController]: setWeekviewStartTime: $startTime');
    pushSettings();
  }
  int getWeekviewEndTime(){
    int result = _settings.weekviewEndTime;
    debugPrint('[SettingsController]:getWeekviewEndTime: $result');
    return result;
  }
  void setWeekviewEndTime(int endTime){
    _settings.weekviewEndTime = endTime;
    debugPrint('[SettingsController]: setWeekviewEndTime: $endTime');
    pushSettings();
  }

  

  bool getIsDayActive({required int day}) {
    switch (day) {
      case 1:
        return getIsMondayActive();
      case 2:
        return getIsTuesdayActive();
      case 3:
        return getIsWednesdayActive();
      case 4:
        return getIsThursdayActive();
      case 5:
        return getIsFridayActive();
      case 6:
        return getIsSaturdayActive();
      case 7:
        return getIsSundayActive();
      default:
        return false;
    }
  }

  List<bool> getActiveDaysAsList() {
    List<bool> result = [
      _settings.isMondayActive,
      _settings.isTuesdayActive,
      _settings.isWednesdayActive,
      _settings.isThursdayActive,
      _settings.isFridayActive,
      _settings.isSaturdayActive,
      _settings.isSundayActive,
    ];

    return result;
  }

  bool getIsMondayActive() {
    bool result = _settings.isMondayActive;
    debugPrint('[SettingsController]: getIsMondayActive: $result');
    return result;
  }

  void setIsMondayActive(bool isMondayActive) {
    debugPrint('[SettingsController]: setIsMondayActive: $isMondayActive');
    _settings.isMondayActive = isMondayActive;
    pushSettings();
  }

  bool getIsTuesdayActive() {
    bool result = _settings.isTuesdayActive;
    debugPrint('[SettingsController]: getIsTuesdayActive: $result');
    return result;
  }

  void setIsTuesdayActive(bool isTuesdayActive) {
    debugPrint('[SettingsController]: setIsTuesdayActive: $isTuesdayActive');
    _settings.isTuesdayActive = isTuesdayActive;
    pushSettings();
  }

  bool getIsWednesdayActive() {
    bool result = _settings.isWednesdayActive;
    debugPrint('[SettingsController]: getIsWednesdayActive: $result');
    return result;
  }

  void setIsWednesdayActive(bool isWednesdayActive) {
    debugPrint('[SettingsController]: setWednesdayActive: $isWednesdayActive');
    _settings.isWednesdayActive = isWednesdayActive;
    pushSettings();
  }

  bool getIsThursdayActive() {
    bool result = _settings.isThursdayActive;
    debugPrint('[SettingsController]: isThursdayActive: $result');
    return result;
  }

  void setIsThursdayActive(bool isThursdayActive) {
    debugPrint('[SettingsController]: setThursdayActive: $isThursdayActive');
    _settings.isThursdayActive = isThursdayActive;
    pushSettings();
  }

  void setIsFridayActive(bool isFridayActive) {
    debugPrint('[SettingsController]: setFridayActive: $isFridayActive');
    _settings.isFridayActive = isFridayActive;
    pushSettings();
  }

  bool getIsFridayActive() {
    bool result = _settings.isFridayActive;
    debugPrint('[SettingsController]: isFridayActive: $result');
    return result;
  }

  void setIsSaturdayActive(bool isSaturdayActive) {
    debugPrint('[SettingsController]: setIsSaturdayActive: $isSaturdayActive');
    _settings.isSaturdayActive = isSaturdayActive;
    pushSettings();
  }

  bool getIsSaturdayActive() {
    bool result = _settings.isSaturdayActive;
    debugPrint('[SettingsController]: getIsSaturdayActive: $result');
    return result;
  }

  void setIsSundayActive(bool isSundayActive) {
    debugPrint('[SettingsController]: setSundayActive: $isSundayActive');
    _settings.isSundayActive = isSundayActive;
    pushSettings();
  }

  bool getIsSundayActive() {
    bool result = _settings.isSundayActive;
    debugPrint('[SettingsController]: isSundayActive: $result');
    return result;
  }

  void setFirstDayOfTheWeek(int firstDayOfTheWeek) {
    debugPrint(
        '[SettingsController]: setFirstDayOfTheWeek: $firstDayOfTheWeek');

    if ((firstDayOfTheWeek < 8) || (firstDayOfTheWeek > 0)) {
      _settings.firstDayOfTheWeek = firstDayOfTheWeek;
      pushSettings();
    } else {
      debugPrint(
          '[SettingsController]: setFirstdayOfTheWeek: Something went wrong.');
    }
  }

  int getFirstDayOfTheWeek() {
    int result = _settings.firstDayOfTheWeek;
    debugPrint('[SettingsController]: getFirstDayOfTheWeek: $result');
    return result;
  }

  
}

String toDtoString(TimeOfDay timeOfDay) {
  String resultmin = timeOfDay.minute.toString();
  String resulthour = timeOfDay.hour.toString();
  if (resulthour.length == 1) {
    resulthour = '0$resulthour';
  }
  if (resultmin.length == 1) {
    resultmin = '0$resultmin';
  }

  return '$resulthour:$resultmin';
}
