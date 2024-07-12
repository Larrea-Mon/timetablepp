// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';

@Entity()
class SettingsBatch {
  @Id()
  int id = 0;
  //GENERAL
  bool isDarkThemeApp = false;
  bool isDarkThemeWidget = true;
  
  //List<bool> daysActive = [true, true, true, true, true, true, true];
  bool isMondayActive = true;
  bool isTuesdayActive = true;
  bool isWednesdayActive = true;
  bool isThursdayActive = true;
  bool isFridayActive = true;
  bool isSaturdayActive = false;
  bool isSundayActive = false;


  int firstDayOfTheWeek = 0;
  //GENERAL
  //NOTIFICACIONES
  bool sendNotifsNextLesson = true;
  int timeSendNotifsNextLesson = 10;

  bool sendNotifsNextHomework = true;
  int timeSendNotifsHomeworkAfterClass = 15; //minutes
  TimeOfDay timeSendNotifsHomeworkFreeDaysHour = TimeOfDay(hour: 10, minute: 0);
  bool sendNotifsNextExam = true;
  int daysSendNotifsNextExam = 7;
  //NOTIFICACIONES
  //SILENCIO AUTOMÁTICO
  bool enableAutoSilence = false;
  int minutesAutosilence = 10;
  // AUTOSILENCE
  // HORARIO
  int lessonsPerDay = 6;
  int lessonsLength = 60;
  int lessonsBreak = 0;
  List<TimeOfDay> lessonsStartTimes = [
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 11, minute: 30)
  ];
}
