import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:timetablepp/Models/subject.dart';

@Entity()
class Lesson {
  @Id()
  int id = 0;

  int startHour = 0;
  int startMinute = 0;

  int endHour = 1;
  int endMinute = 0;

  int day = 0;

  final subject = ToOne<Subject>();

  Lesson(
      {required this.day,
      required this.startHour,
      required this.startMinute,
      required this.endHour,
      required this.endMinute});
  Lesson.asToD(
      {required this.day,
      required TimeOfDay startTod,
      required TimeOfDay endTod}) {
    startHour = startTod.hour;
    startMinute = startTod.minute;

    endHour = endTod.hour;
    endMinute = endTod.minute;
  }

  int getDay(){
    return day;
  }
  void setDay({required int day}){
    this.day = day;
  }

  @override
  String toString() {
    return '[Lesson]: id: $id,day: $day startHour: $startHour, startMinute $startMinute, endHour: $endHour, endMinute: $endMinute';
  }
  TimeOfDay getStartTimeOfDay(){
    return TimeOfDay(hour: startHour, minute: startMinute);
  }
  TimeOfDay getEndTimeOfDay(){
    return TimeOfDay(hour: endHour, minute: endMinute);
  }

  int getDuration() {
    int result = 0;
    result = endHour*60;
    result = result + endMinute;
    result = result - startMinute;
    result = result - startHour*60;
    debugPrint('[Lesson] lesson $id: start:${getStartTimeOfDay()} end:${getEndTimeOfDay()}. Duration is $result');
    return result;
  }
}

enum Days {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
