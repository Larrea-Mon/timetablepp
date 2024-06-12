// ignore_for_file: unused_import

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

  TermPeriod termPeriod =
      TermPeriod(start: DateTime.now(), end: DateTime.now());
}
