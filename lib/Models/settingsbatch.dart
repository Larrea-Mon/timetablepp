  // ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

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
  String appActiveTheme = 'winter';
  int widgetActiveTheme = 0;

  //List<bool> daysActive = [true, true, true, true, true, true, true];
  bool isMondayActive = true;
  bool isTuesdayActive = true;
  bool isWednesdayActive = true;
  bool isThursdayActive = true;
  bool isFridayActive = true;
  bool isSaturdayActive = false;
  bool isSundayActive = false;
  //SEGUN EL ESTANDAR MUNDIAL LOS DIAS DE LA SEMANA SON DEL 1 AL 7. DE 0 NADA.
  int firstDayOfTheWeek = 1;
  //GENERAL
  //NOTIFICACIONES
  bool sendNotifsNextLesson = true;
  int timeSendNotifsNextLesson = 10;

  bool sendNotifsNextHomework = true;
  int timeSendNotifsHomeworkAfterClass = 15; //minutes
  //TimeOfDay timeSendNotifsHomeworkFreeDaysHour = TimeOfDay(hour: 10, minute: 0);
  int timeSendNotifsHomeworkFreeDaysHour = 10;
  int timeSendNotifsHomeworkFreeDaysMinute = 0;
  int daysSendNotifsNextHomework = 5;
  bool sendNotifsNextExam = true;
  int daysSendNotifsNextExam = 7;
  //NOTIFICACIONES
  //SILENCIO AUTOMÁTICO
  bool enableAutoSilence = false;
  int minutesAutosilence = 10;
  // AUTOSILENCE
  // HORARIO
  int weekviewStartTime = 8;
  int weekviewEndTime = 24;
  
  @override
  toString() {
    return "[SettingsBatch] ID: '$id' \n" +
        "GENERAL \n" +
        "appActiveTheme: $appActiveTheme \n" +
        "widgetActiveTheme: $widgetActiveTheme \n" +
        "daysActive: [$isMondayActive,$isTuesdayActive,$isWednesdayActive,$isThursdayActive,$isFridayActive,$isSaturdayActive,$isSundayActive] \n" +
        "firstDayOfTheWeek: $firstDayOfTheWeek\n" +
        "NOTIFICACIONES \n" +
        "sendNotifsNextLesson: $sendNotifsNextLesson \n" + 
        "timeSendNotifsNextLesson: $timeSendNotifsNextLesson m\n" + 
        "sendNotifsNextHomework: $sendNotifsNextHomework\n" + 
        "timeSendNotifsHomeworkAfterClass: $timeSendNotifsHomeworkAfterClass m\n" + 
        "timeSendNotifsHomeworkFreeDaysHour: $timeSendNotifsHomeworkFreeDaysHour h\n" +
        "timeSendNotifsHomeworkFreeDaysMinute: $timeSendNotifsHomeworkFreeDaysMinute m\n" +
        "daysSendNotifsNextHomework: $daysSendNotifsNextHomework \n" + 
        "sendNotifsNextExam: $sendNotifsNextExam \n" +
        "daysSendNotifsNextExam: $daysSendNotifsNextExam \n" +
        "AUTOSILENCE \n"+
        "enableAutoSilence: $enableAutoSilence\n" + 
        "minutesAutosilence: $minutesAutosilence\n"+
        "HORARIO\n" +
        "weekviewStartTime: $weekviewStartTime\n"+
        "weekviewEndTIme: $weekviewEndTime\n";
  }
}
