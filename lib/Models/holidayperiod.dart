// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HolidayPeriod {
    DateTime start;
    DateTime end;
    String name;
    
  HolidayPeriod(this.start,this.end,this.name);

  @override
  String toString() {
    
    return 'HolidayPeriod: Start:[$start], End:[$end], Name:[$name]';
  }
  String startDateToString(){
    String startday= this.start.day.toString();
    String startmonth = this.start.month.toString();
    String startyear = this.start.year.toString();
    return ("$startday/$startmonth/$startyear");
  }

  

} 