// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';

//esta clase solo existe para pintar las líneas de la timetable y aparecer en settings.
@Entity()
class SubjectTime {
  @Id()
  int id = 0;
  late int hour;
  late int minute;
}
