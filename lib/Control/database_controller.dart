// ignore_for_file: unused_import, prefer_final_fields, prefer_const_constructors, unused_field

import 'dart:collection';
import 'dart:ffi';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/objectbox.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/settingsbatch.dart';
import 'package:timetablepp/Models/termperiod.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Models/weekview_lesson.dart';

import '../Models/subject.dart';
import '../objectbox.g.dart';

import '../main.dart';

class DatabaseController {
  DatabaseController._privateConstructor();

  static final DatabaseController _instance =
      DatabaseController._privateConstructor();
  factory DatabaseController() {
    return _instance;
  }

  final Box<HolidayPeriod> _holidaysBox = objectbox.store.box<HolidayPeriod>();
  final Box<TermPeriod> _termPeriodBox = objectbox.store.box<TermPeriod>();
  final Box<Subject> _subjectBox = objectbox.store.box<Subject>();
  final Box<SettingsBatch> _settingsBox = objectbox.store.box<SettingsBatch>();
  final Box<WeekviewLesson> _weekviewBox =
      objectbox.store.box<WeekviewLesson>();
  // TERMPERIOD
  TermPeriod getTermPeriod(int id) {
    var result = _termPeriodBox.get(id);
    if (result != null) {
      return result;
    } else {
      return TermPeriod(start: null, end: null);
    }
  }

  void putTermPeriod(TermPeriod termPeriod) {
    _termPeriodBox.put(termPeriod);
  }

  // TERMPERIOD
  //term period sólo necesita estas dos
  //SETTINGSBATCH

  SettingsBatch getSettingsBatch() {
    var result = _settingsBox.get(1);
    if (result != null) {
    } else {
      result = SettingsBatch();
    }
    return result;
  }

  void setSettingsBatch(SettingsBatch settings) {
    _settingsBox.put(settings);
  }
  //SETTINGSBATCH
  //SettingsBatch también solo necesita estas dos.

  //SUBJECT
  Subject getSubject(int id) {
    var result = _subjectBox.get(id);
    if (result != null) {
      return result;
    } else {
      return Subject('', '', '', '', '');
    }
  }

  void putSubject(Subject subject) {
    _subjectBox.put(subject);
  }

  void removeSubject(int id) {
    _subjectBox.remove(id);
  }

  List<Subject> getAllSubjects() {
    return _subjectBox.getAll();
  }

  int deleteAllSubjects() {
    return _subjectBox.removeAll();
  }

  //SUBJECT
  //HOLIDAYS
  HolidayPeriod getHolidayPeriod(int id) {
    var result = _holidaysBox.get(id);
    if (result != null) {
      return result;
    } else {
      return HolidayPeriod(null, null, '');
    }
  }

  void putHolidayPeriod(HolidayPeriod holidayPeriod) {
    _holidaysBox.put(holidayPeriod);
  }

  void removeHolidayPeriod(int id) {
    _holidaysBox.remove(id);
  }

  List<HolidayPeriod> getAllHolidayPeriods() {
    return _holidaysBox.getAll();
  }

  int deleteHolidays() {
    return _holidaysBox.removeAll();
  }

  //Holidays
  //WeekviewLesson
  WeekviewLesson getWeekviewLesson(int id) {
    return _weekviewBox.get(id)!;
  }

  void putWeekviewLesson(WeekviewLesson weekviewLesson) {
    _weekviewBox.put(weekviewLesson);
  }

  bool removeWeekviewLesson(int id) {
    return _weekviewBox.remove(id);
  }

  List<WeekviewLesson> getAllWeekviewLessons() {
    var lessons = _weekviewBox.getAll();

    return lessons;
  }

  int deleteAllWeekviewLessons() {
    return _weekviewBox.removeAll();
  }
  void putAllLessons(List<WeekviewLesson> lessons){
    _weekviewBox.putMany(lessons);
  }

//WeekviewLesson
}
