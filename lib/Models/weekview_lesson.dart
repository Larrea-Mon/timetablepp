// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';

@Entity()
class WeekviewLesson implements Comparable {
  @Id()
  int id = 0;

  int startHour = 9;
  int startMinute = 0;

  WeekviewLesson({required this.startHour, required this.startMinute});

  WeekviewLesson.useThisConstructor({
    required hour,
    required minute,
  }) {
    /*
    int remainer = startMinute % 60;
    int result = startMinute ~/ 60;
    debugPrint(
        '[WeekviewLesson.useThisConstructor:] hour: $hour, minute: $minute,  result: $result, remainer: $remainer,');
    this.startMinute = remainer;
    result = startHour + result;
    if (result >= 24) {
      result = result - 24;
    }
    debugPrint(
        '[WeekviewLesson.useThisConstructor:] hour: $hour, minute: $minute,  result: $result, remainer: $remainer,');
    this.startHour = result;*/
    if (minute > 59) {
      hour++;
      minute = minute - 60;
    }
    if (hour > 23) {
      hour = hour - 24;
    }
    startHour = hour;
    startMinute = minute;
  }

  WeekviewLesson.asToD(TimeOfDay toD) {
    WeekviewLesson.useThisConstructor(hour: toD.hour, minute: toD.minute);
  }

  getTimeOfDay() {
    return TimeOfDay(hour: startHour, minute: startMinute);
  }

  setTimeOfDay(TimeOfDay tod) {
    startHour = tod.hour;
    startMinute = tod.minute;
  }

  @override
  String toString() {
    return '[WeekviewLesson]: startHour: $startHour, startMinute: $startMinute';
  }

  @override
  int compareTo(other) {
    other = other as WeekviewLesson;
    if (other.startHour > startHour) {
      return -1;
    } else if (other.startHour < startHour) {
      return 1;
    } else if (other.startMinute > startMinute) {
      return -1;
    } else if (other.startMinute < startMinute) {
      return 1;
    } else {
      return 0;
    }
  }
}
