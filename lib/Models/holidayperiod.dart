// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';

class HolidayPeriod {
  DateTime? start;
  DateTime? end;
  String name;

  get getStart => start;

  void setStart(DateTime start) {
    this.start = start;
  }

  DateTime? getEnd(){
    return end;
  }

  void setEnd(DateTime end) {
    this.end = end;
  }

  String getName(){
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getStartAsString() {
    if (start != null) {
      return dateToString(start!);
    } else {
      return '-';
    }
  }

  String getEndAsString() {
     if (end != null) {
      return dateToString(end!);
    } else {
      return '-';
    }
  }

  HolidayPeriod(this.start, this.end, this.name);

  @override
  String toString() {
    return 'HolidayPeriod: Start:[$start], End:[$end], Name:[$name]';
  }
}
