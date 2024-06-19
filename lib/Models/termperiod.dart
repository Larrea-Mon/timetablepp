// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';

class TermPeriod {
  DateTime? start;
  DateTime? end;


  //TODO Poner que cuando se introduce una fecha que sea coherente con la otra
  TermPeriod({
    required this.start,
    required this.end,
  });

  @override
  String toString() {
    return 'TermPeriod:[start:$start],[end:$end]';
  }

  String startDateToString() {
    if (start != null) {
      return dateToString(start!);
    } else {
      return ("-");
    }
  }

  String endDateToString() {
    if (end != null) {

      return dateToString(end!);
    } else {
      return ("-");
    }
  }
}
