// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';

class HolidayPeriod {
  DateTime start;
  DateTime end;
  String name;

  HolidayPeriod(this.start, this.end, this.name);

  @override
  String toString() {
    return 'HolidayPeriod: Start:[$start], End:[$end], Name:[$name]';
  }
}
