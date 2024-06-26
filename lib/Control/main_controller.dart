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

  Future<void> _addHoliday(HolidayPeriod holiday) async {
    holidaysBox.put(holiday);
  }

  late TermPeriod _termPeriod;
  HolidayPeriod _currentHolidayPeriod = HolidayPeriod(null, null, '');

  void debugHolidays() {
    _addHoliday(HolidayPeriod(DateTime.utc(2024, 12, 18),
        DateTime.utc(2025, 01, 20), 'Vacaciones de Navidad'));
    _addHoliday(HolidayPeriod(
        DateTime.utc(2024, 01, 06), DateTime.utc(2024, 01, 07), 'Reyes Magos'));
    _addHoliday(HolidayPeriod(
        DateTime.utc(2024, 01, 01), DateTime.utc(2024, 01, 01), 'Año Nuevo'));
    _addHoliday(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 14), 'San Valentin'));
    _addHoliday(HolidayPeriod(DateTime.utc(2024, 03, 23),
        DateTime.utc(2024, 03, 23), 'Viernes Santo'));
    _addHoliday(HolidayPeriod(DateTime.utc(2024, 05, 01),
        DateTime.utc(2024, 05, 01), 'Dia del trabajador'));
    _addHoliday(HolidayPeriod(DateTime.utc(2024, 10, 12),
        DateTime.utc(2024, 10, 12), 'Fiesta Nacional de españa'));
    _addHoliday(HolidayPeriod(DateTime.utc(2024, 11, 14),
        DateTime.utc(2024, 11, 15), 'Dia de la Constitución'));
  }

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

  void pushCurrentHoliday(String name) {
    _currentHolidayPeriod.setName(name);
    holidaysBox.put(getCurrentHoliday());
  }
}

void todoButton() {
  Fluttertoast.showToast(
      msg: '//TODO implementar esto', backgroundColor: Colors.grey);
}

String dateToString(DateTime dateTime) {
  String day = dateTime.day.toString();
  String month = dateTime.month.toString();
  String year = dateTime.year.toString();
  return ("$day/$month/$year");
}
