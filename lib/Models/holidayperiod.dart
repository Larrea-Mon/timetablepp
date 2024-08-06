// ignore_for_file: unused_import

import 'dart:async';
import 'package:objectbox/objectbox.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Control/main_controller.dart';
@Entity()
class HolidayPeriod {
  @Id()
  int id = 0;

  @Property(type: PropertyType.date)
  DateTime? start;
  @Property(type: PropertyType.date)
  DateTime? end;
  
  String name = '';

  DateTime getStart(){
    if (start != null) {
      return start!;
    } else {
      return DateTime(1970);
    }
  }

  void setStart(DateTime start) {
    this.start = start;
  }

  DateTime? getEnd(){
    return end;
  }

  void setEnd(DateTime end) {
    this.end = end;
  }

  String getName(){
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  

  String getStartAsString() {
    if (start != null) {
      return dateToString(start!);
    } else {
      return '-';
    }
  }

  String getEndAsString() {
     if (end != null) {
      return dateToString(end!);
    } else {
      return '-';
    }
  }
  
  HolidayPeriod({required this.start,required this.end, required this.name});
  HolidayPeriod.clone(HolidayPeriod holidayPeriod){
    this.start = holidayPeriod.start; 
    this.end = holidayPeriod.end;
    this.name=  holidayPeriod.name;
  } 

  @override
  String toString() {
    return 'HolidayPeriod: Start:[$start], End:[$end], Name:[$name]';
  }
}

String dateToString(DateTime dateTime) {
  String day = dateTime.day.toString();
  String month = dateTime.month.toString();
  String year = dateTime.year.toString();
  return ("$day/$month/$year");
}
