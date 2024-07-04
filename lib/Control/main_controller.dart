// ignore_for_file: unused_import, prefer_final_fields

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/objectbox.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/termperiod.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';
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

  final Box<HolidayPeriod> holidaysBox = objectbox.store.box<HolidayPeriod>();
  final Box<TermPeriod> termPeriodBox = objectbox.store.box<TermPeriod>();
  final Box<Subject> subjectBox = objectbox.store.box<Subject>();

  late TermPeriod _termPeriod;
  HolidayPeriod _currentHolidayPeriod = HolidayPeriod(null, null, '');

  List<HolidayPeriod> getHolidays() {
    var holidays = holidaysBox.getAll();
    holidays.sort((a, b) => a.getStart().compareTo(b.getStart()));
    return holidays;
  }

  TermPeriod getTermPeriod() {
    var result = termPeriodBox.get(1);
    if (result != null) {
      _termPeriod = result;
      return _termPeriod;
    } else {
      _termPeriod = TermPeriod(start: null, end: null);
      return _termPeriod;
    }
  }

  void setTermPeriodStart(DateTime start) {
    _termPeriod.start = start;
    termPeriodBox.put(_termPeriod);
  }

  void setTermPeriodEnd(DateTime end) {
    _termPeriod.end = end;
    termPeriodBox.put(_termPeriod);
  }

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

  int deleteHolidays() {
    return holidaysBox.removeAll();
  }

  void addHoliday(HolidayPeriod holiday) async {
    holidaysBox.put(holiday);
  }

  void pushCurrentHoliday(String name) {
    _currentHolidayPeriod.setName(name);
    holidaysBox.put(getCurrentHoliday());
  }

  void deleteCurrentHoliday() {
    holidaysBox.remove(_currentHolidayPeriod.id);
  }

  void addSubject(Subject subject) async {
    subjectBox.put(subject);
  }

  List<Subject> getAllSubjects() {
    return subjectBox.getAll();
  }

  void deleteSubject(int id) {
    subjectBox.remove(id);
  }

  int deleteAllSubjects() {
    return subjectBox.removeAll();
  }
}

void todoButton() {
  Fluttertoast.showToast(
      msg: '//TODO implementar esto', backgroundColor: Colors.grey);
}



