// ignore_for_file: unused_import, prefer_final_fields

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/termperiod.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MainController {
  MainController._privateConstructor();

  static final MainController _instance = MainController._privateConstructor();
  factory MainController() {
    return _instance;
  }

  List<HolidayPeriod> holidays = List<HolidayPeriod>.empty(growable: true);

  TermPeriod _termPeriod = TermPeriod(start: null, end: null);
  HolidayPeriod _currentHolidayPeriod = HolidayPeriod(null, null, '');

  void debugHolidays() {
    if (holidays.isNotEmpty) {
      holidays = List<HolidayPeriod>.empty(growable: true);
    }

    holidays.add(HolidayPeriod(DateTime.utc(2024, 01, 06),
        DateTime.utc(2024, 01, 07), 'Dia de Reyes Magos'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin1'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin2'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin3'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin4'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin5'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valenti6'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin7'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin8'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin9'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin10'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin11'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin12'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin13'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin14'));
    holidays.add(HolidayPeriod(DateTime.utc(2024, 02, 14),
        DateTime.utc(2024, 02, 15), 'Dia de san valentin15'));
  }

  List<HolidayPeriod> getHolidays() {
    return holidays;
  }

  TermPeriod getTermPeriod() {
    return _termPeriod;
  }

  void setTermPeriodStart(DateTime start) {
    _termPeriod.start = start;
  }

  void setTermPeriodEnd(DateTime end) {
    _termPeriod.end = end;
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

  void pushCurrentHoliday(String name) {
    _currentHolidayPeriod.setName(name);
    holidays.add(HolidayPeriod.clone(_currentHolidayPeriod));
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
