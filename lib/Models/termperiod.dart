// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';
@Entity()
class TermPeriod {
  @Id()
  int id = 0;
  @Property(type: PropertyType.date)
  DateTime? start;
  @Property(type: PropertyType.date)
  DateTime? end;


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
