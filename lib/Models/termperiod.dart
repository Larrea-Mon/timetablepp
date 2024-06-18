// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
      String startday = start!.day.toString();
      String startmonth = start!.month.toString();
      String startyear = start!.year.toString();

      return ("$startday/$startmonth/$startyear");
    } else {
      return ("-");
    }
  }

  String endDateToString() {
    if (end != null) {
      String endday = end!.day.toString();
      String endmonth = end!.month.toString();
      String endyear = end!.year.toString();
      return ("$endday/$endmonth/$endyear");
    } else {
      return ("-");
    }
  }
}
