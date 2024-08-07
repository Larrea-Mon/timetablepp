// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Models/lesson.dart';
import 'package:timetablepp/Models/subject.dart';

class WeekviewBackend {
  WeekviewBackend._privateConstructor();

  static final WeekviewBackend _instance =
      WeekviewBackend._privateConstructor();
  factory WeekviewBackend() {
    return _instance;
  }

  /* EN DESUSO
  int getLessonsLength() {
    return SettingsController().getLessonsLength();
  }
  */

  /* EN DESUSO
  void setLessonsLength(int len) {
    if (len > lessons.length) {
      debugPrint('[WeekviewBackend][INFO]:setLessonsLength: el numero introducido es mayor que el actual');
      int first = SettingsController().getLessonsLength();
      int second = SettingsController().getLessonsBreak();
      for (var i = 1; i < lessons.length; i++) {
        int total = first + second;
        int hours = total ~/ 60;
        int minutes = total % 60;
        lessons.add(
          WeekviewLesson.asToD(
            TimeOfDay(
              hour: (lessons[i - 1].startHour + hours),
              minute: lessons[i - 1].startMinute + minutes,
            ),
          ),
        );
      }
    } if (len < lessons.length) {
      debugPrint('[WeekviewBackend][INFO]:setLessonsLength: el numero introducido es menor que el actual');
      int first = SettingsController().getLessonsLength();
      int second = SettingsController().getLessonsBreak();
      for (var i = 1; i < lessons.length; i++) {
        int total = first + second;
        int hours = total ~/ 60;
        int minutes = total % 60;
        lessons.add(
          WeekviewLesson.asToD(
            TimeOfDay(
              hour: (lessons[i - 1].startHour + hours),
              minute: lessons[i - 1].startMinute + minutes,
            ),
          ),
        );
      }
    }
  }
   */

  /* EN DESUSO
  void setLessonsBreak(int lessonsBreak) {
    SettingsController().setLessonsBreak(lessonsBreak);
    //TAMBIEN CAMBIAR OTRAS COSAS
  }
   int getLessonsBreak() {
    return SettingsController().getLessonsBreak();
  }
  
 

  int getLessonsPerDay() {
    return SettingsController().getLessonsPerDay();
  } */

  List<DateTime> getDatesForWeekView() {
    //EN DESUSO TOTAL
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    List<DateTime> result = List<DateTime>.empty(growable: true);
    //result.add(date);
    //CALCULAMOS LOS DIAS QUE MOSTRAR EN EL CALENDARIO.
    int firstDotW = SettingsController().getFirstDayOfTheWeek();
    //EL PLAN: PRIMERO SACAR LA SEMANA, SUS SIETE DÍAS Y LUEGO RESTAR LOS DIAS INACTIVOS
    //PASO 1
    if (date.weekday == firstDotW) {
      debugPrint('[WeekviewBackend]: Haber si me muero 1');
      for (var i = 0; i < 7; i++) {
        result.add(date.add(Duration(days: i)));
      }
      /*
      result.add(date.add(Duration(days: 1)));
      result.add(date.add(Duration(days: 2)));
      result.add(date.add(Duration(days: 3)));       
      result.add(date.add(Duration(days: 4))); 
      result.add(date.add(Duration(days: 5))); 
      result.add(date.add(Duration(days: 6))); 
      result.add(date.add(Duration(days: 7))); 
      */
    } else if (date.weekday > firstDotW) {
      debugPrint('[WeekviewBackend]:Haber si me muero 2');
      int delta = firstDotW - date.weekday;
      for (var i = 0; i < 7; i++) {
        if (i < delta) {
          result.add(date.subtract(Duration(days: delta - i)));
        } else if (i >= delta) {
          result.add(date.add(Duration(days: i - delta)));
        }
      }
    } else if (date.weekday < firstDotW) {
      debugPrint('[WeekviewBackend]: Haber si me muero 3');
      int delta = date.weekday - firstDotW;
      for (var i = 0; i < 7; i++) {
        if (i < delta) {
          result.add(date.subtract(Duration(days: delta - i)));
        } else if (i >= delta) {
          result.add(date.add(Duration(days: i - delta)));
        }
      }
    }
    for (var i = 0; i < 7; i++) {
      debugPrint('[WeekviewBackend][getDatesForWeekView]:${result[i]}');
    }
    return result;
  }

  List<TimePlannerTitle> getActiveDays() {
    List<TimePlannerTitle> result = List.empty(growable: true);

    switch (SettingsController().getFirstDayOfTheWeek()) {
      case 1:
        result.addAll([
          if (SettingsController().getIsMondayActive())
            TimePlannerTitle(title: 'Lunes'),
          if (SettingsController().getIsTuesdayActive())
            TimePlannerTitle(title: 'Martes'),
          if (SettingsController().getIsWednesdayActive())
            TimePlannerTitle(title: 'Miercoles'),
          if (SettingsController().getIsThursdayActive())
            TimePlannerTitle(title: 'Jueves'),
          if (SettingsController().getIsFridayActive())
            TimePlannerTitle(title: 'Viernes'),
          if (SettingsController().getIsSaturdayActive())
            TimePlannerTitle(title: 'Sábado'),
          if (SettingsController().getIsSundayActive())
            TimePlannerTitle(title: 'Domingo'),
        ]);
        break;
      case 2:
        result.addAll([
          if (SettingsController().getIsTuesdayActive())
            TimePlannerTitle(title: 'Martes'),
          if (SettingsController().getIsWednesdayActive())
            TimePlannerTitle(title: 'Miercoles'),
          if (SettingsController().getIsThursdayActive())
            TimePlannerTitle(title: 'Jueves'),
          if (SettingsController().getIsFridayActive())
            TimePlannerTitle(title: 'Viernes'),
          if (SettingsController().getIsSaturdayActive())
            TimePlannerTitle(title: 'Sábado'),
          if (SettingsController().getIsSundayActive())
            TimePlannerTitle(title: 'Domingo'),
          if (SettingsController().getIsMondayActive())
            TimePlannerTitle(title: 'Lunes'),
        ]);
        break;
      case 3:
        result.addAll([
          if (SettingsController().getIsWednesdayActive())
            TimePlannerTitle(title: 'Miercoles'),
          if (SettingsController().getIsThursdayActive())
            TimePlannerTitle(title: 'Jueves'),
          if (SettingsController().getIsFridayActive())
            TimePlannerTitle(title: 'Viernes'),
          if (SettingsController().getIsSaturdayActive())
            TimePlannerTitle(title: 'Sábado'),
          if (SettingsController().getIsSundayActive())
            TimePlannerTitle(title: 'Domingo'),
          if (SettingsController().getIsMondayActive())
            TimePlannerTitle(title: 'Lunes'),
          if (SettingsController().getIsTuesdayActive())
            TimePlannerTitle(title: 'Martes'),
        ]);
      case 4:
        result.addAll([
          if (SettingsController().getIsThursdayActive())
            TimePlannerTitle(title: 'Jueves'),
          if (SettingsController().getIsFridayActive())
            TimePlannerTitle(title: 'Viernes'),
          if (SettingsController().getIsSaturdayActive())
            TimePlannerTitle(title: 'Sábado'),
          if (SettingsController().getIsSundayActive())
            TimePlannerTitle(title: 'Domingo'),
          if (SettingsController().getIsMondayActive())
            TimePlannerTitle(title: 'Lunes'),
          if (SettingsController().getIsTuesdayActive())
            TimePlannerTitle(title: 'Martes'),
          if (SettingsController().getIsWednesdayActive())
            TimePlannerTitle(title: 'Miercoles'),
        ]);
        break;
      case 5:
        result.addAll([
          if (SettingsController().getIsFridayActive())
            TimePlannerTitle(title: 'Viernes'),
          if (SettingsController().getIsSaturdayActive())
            TimePlannerTitle(title: 'Sábado'),
          if (SettingsController().getIsSundayActive())
            TimePlannerTitle(title: 'Domingo'),
          if (SettingsController().getIsMondayActive())
            TimePlannerTitle(title: 'Lunes'),
          if (SettingsController().getIsTuesdayActive())
            TimePlannerTitle(title: 'Martes'),
          if (SettingsController().getIsWednesdayActive())
            TimePlannerTitle(title: 'Miercoles'),
          if (SettingsController().getIsThursdayActive())
            TimePlannerTitle(title: 'Jueves'),
        ]);
        break;
      case 6:
        result.addAll([
          if (SettingsController().getIsSaturdayActive())
            TimePlannerTitle(title: 'Sábado'),
          if (SettingsController().getIsSundayActive())
            TimePlannerTitle(title: 'Domingo'),
          if (SettingsController().getIsMondayActive())
            TimePlannerTitle(title: 'Lunes'),
          if (SettingsController().getIsTuesdayActive())
            TimePlannerTitle(title: 'Martes'),
          if (SettingsController().getIsWednesdayActive())
            TimePlannerTitle(title: 'Miercoles'),
          if (SettingsController().getIsThursdayActive())
            TimePlannerTitle(title: 'Jueves'),
          if (SettingsController().getIsFridayActive())
            TimePlannerTitle(title: 'Viernes'),
        ]);
        break;
      case 7:
        result.addAll([
          if (SettingsController().getIsSundayActive())
            TimePlannerTitle(title: 'Domingo'),
          if (SettingsController().getIsMondayActive())
            TimePlannerTitle(title: 'Lunes'),
          if (SettingsController().getIsTuesdayActive())
            TimePlannerTitle(title: 'Martes'),
          if (SettingsController().getIsWednesdayActive())
            TimePlannerTitle(title: 'Miercoles'),
          if (SettingsController().getIsThursdayActive())
            TimePlannerTitle(title: 'Jueves'),
          if (SettingsController().getIsFridayActive())
            TimePlannerTitle(title: 'Viernes'),
          if (SettingsController().getIsSaturdayActive())
            TimePlannerTitle(title: 'Sábado'),
        ]);
        break;
      default:
        result.addAll(
          [
            if (SettingsController().getIsMondayActive())
              TimePlannerTitle(title: 'Lunes'),
            if (SettingsController().getIsTuesdayActive())
              TimePlannerTitle(title: 'Martes'),
            if (SettingsController().getIsWednesdayActive())
              TimePlannerTitle(title: 'Miercoles'),
            if (SettingsController().getIsThursdayActive())
              TimePlannerTitle(title: 'Jueves'),
            if (SettingsController().getIsFridayActive())
              TimePlannerTitle(title: 'Viernes'),
            if (SettingsController().getIsSaturdayActive())
              TimePlannerTitle(title: 'Sábado'),
            if (SettingsController().getIsSundayActive())
              TimePlannerTitle(title: 'Domingo'),
          ],
        );
    }
    return result;
  }

  List<TimePlannerTask> getTasksDummy() {
    List<TimePlannerTask> result = [
      TimePlannerTask(
        // background color for task
        color: Colors.purple,
        // day: Index of header, hour: Task will be begin at this hour
        // minutes: Task will be begin at this minutes
        dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
        // Minutes duration of task
        minutesDuration: 90,
        // Days duration of task (use for multi days task)
        daysDuration: 1,
        onTap: () {
          todoButton();
        },
        child: Text(
          'this is a task',
          style: TextStyle(color: Colors.grey[350], fontSize: 12),
        ),
      ),
    ];
    return result;
  }

  List<TimePlannerTask> getTasks() {
    List<TimePlannerTask> result = List.empty(growable: true);

    int counter = 0;
    for (var i = 0; i < 6; i++) {
      int dayMod = (i + SettingsController().getFirstDayOfTheWeek()) % 7;
      if (SettingsController().getIsDayActive(day: dayMod)) {
        debugPrint(
            '[WeekviewBackend]: GetTasks: Pintando las tasks del dia de la semana: $dayMod');
        List<Lesson> lessons = getLessonsDay(day: dayMod);
        debugPrint(
            '[WeekviewBackend]: GetTasks: Hay ${lessons.length} clases el día $dayMod');
        for (var element in lessons) {
          result.add(
            TimePlannerTask(
              color: MainController()
                  .getColorFromName(element.subject.target!.color),
              minutesDuration: element.getDuration(),
              dateTime: TimePlannerDateTime(
                  day: counter,
                  hour: element.startHour,
                  minutes: element.startMinute),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                isThreeLine: true,
                title: Text(element.subject.target!.abv!),
                subtitle: Text(element.subject.target!.place!, maxLines: 1,overflow: TextOverflow.fade, ),
              ),
            ),
          );
        }
        counter++;
      }
    }

    return result;
  }

  List<Lesson> getLessonsDay({required int day}) {
    debugPrint(
        '[WeekviewBackend]: getLessonsDay(): me han pedido el numero de clases del día de la semana:$day');
    List<Lesson> result = List.empty(growable: true);
    List<Lesson> lessons = DatabaseController().getActiveLessons();
    ('[WeekviewBackend]: getLessonsDay(): Hay un total de ${lessons.length} lessons.');
    for (var lesson in lessons) {
      if (lesson.day == day) {
        result.add(lesson);
      }
    }
    ('[WeekviewBackend]getLessonsDay(): result contiene ${result.length} lessons.');
    return result;
  }

  int _getRelativeLessonDay(Lesson lesson) {
    int result = 0;
    result = result + lesson.day;
    result = result - SettingsController().getFirstDayOfTheWeek();
    return result;
  }

  List<Subject> getAllSubjects() {
    return DatabaseController().getAllSubjects();
  }
}
