// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TermPeriod{
   DateTime? start;
   DateTime? end;


    TermPeriod({
    required this.start,
    required this.end,
  });

  @override
  String toString(){
    return 'TermPeriod:[start:$start],[end:$end]';
  }
}
