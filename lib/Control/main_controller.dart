// ignore_for_file: unused_import, prefer_final_fields

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/objectbox.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
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

  final Box<HolidayPeriod> holidaysBox = objectbox.store.box<HolidayPeriod>();
  final Box<TermPeriod> termPeriodBox = objectbox.store.box<TermPeriod>();
  final Box<Subject> subjectBox = objectbox.store.box<Subject>();

  late TermPeriod _termPeriod;
  HolidayPeriod _currentHolidayPeriod = HolidayPeriod(null, null, '');
  Subject _currentSubject =
      Subject('New Subject', '', '', '', SubjectColors.sky.name);

  // TERM PERIODS -
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
    holidaysBox.put(getCurrentHoliday());
  }

  void deleteCurrentHoliday() {
    holidaysBox.remove(_currentHolidayPeriod.id);
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
    subjectBox.put(_currentSubject);
  }

  void deleteCurrentSubject() {
    subjectBox.remove(_currentSubject.id);
  }

  //CURRENT SUBJECT
  // HOLIDAYS DB
  int deleteHolidays() {
    return holidaysBox.removeAll();
  }

  void addHoliday(HolidayPeriod holiday) async {
    holidaysBox.put(holiday);
  }

  List<HolidayPeriod> getHolidays() {
    var holidays = holidaysBox.getAll();
    holidays.sort((a, b) => a.getStart().compareTo(b.getStart()));
    return holidays;
  } //HOLIDAYS DB

  //SUBJECT DB
  void addSubject(Subject subject) async {
    subjectBox.put(subject);
  }

  List<Subject> getAllSubjects() {
    return subjectBox.getAll();
  }

  void deleteSubject(Subject subject) {
    subjectBox.remove(subject.id);
  }

  int deleteAllSubjects() {
    return subjectBox.removeAll();
  }

  editCurrentSubject(
      String name, String abv, String teacher, String place, String color) {
    _currentSubject.name = name;
    _currentSubject.abv = abv;
    _currentSubject.teacher = teacher;
    _currentSubject.place = place;
    _currentSubject.color = color;
  } //SUBJECT DB
}

void todoButton() {
  Fluttertoast.showToast(
      msg: '//TODO implementar esto', backgroundColor: Colors.grey);
}
