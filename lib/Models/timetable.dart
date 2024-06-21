//TIMETABLE es la clase que contiene todas las clases. 
//La usuaria puede tener más de una timetable, pero sólo una está activa a la vez.
import 'package:sqflite/sqflite.dart';
import 'package:timetablepp/Models/event.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/Models/termperiod.dart';


class Timetable{
  String name = '';
  List<Subject> list = List.empty(growable: true);
  TermPeriod term = TermPeriod(start: null, end: null);
  List<HolidayPeriod> holidays = List.empty(growable: true);
  List<Event> events = List.empty(growable: true);

  Timetable(this.name);

}