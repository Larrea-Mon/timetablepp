import 'package:flutter/material.dart';

import 'package:timetablepp/Control/database_controller.dart';

import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Models/weekview_lesson.dart';

class WeekviewBackend {
  WeekviewBackend._privateConstructor();

  static final WeekviewBackend _instance =
      WeekviewBackend._privateConstructor();
  factory WeekviewBackend() {
    return _instance;
  }
  late List<WeekviewLesson> _lessons;

  void pushLessons() {
    debugPrint('[WeekviewBackend]: pushLessons()');
    for (WeekviewLesson element in _lessons) {
      debugPrint('[WeekviewBackend]: pushLessons(): $element');
      DatabaseController().putWeekviewLesson(element);
    }
  }

  initLessons() {
    _lessons = DatabaseController().getAllWeekviewLessons();

    if (_lessons.isEmpty) {
      debugPrint('[WeekviewBackend]: Lessons Is Empty');
      generateLessonsFromZero();
    } else if (_lessons.length < SettingsController().getLessonsPerDay()) {
      debugPrint(
          '[WeekviewBackend]: Hay menos Lessons de las que debería haber');
    }
  }

  generateLessonsFromZero() {
    _lessons.add(WeekviewLesson.useThisConstructor(hour: 8, minute: 0));
    for (var i = 1; i < SettingsController().getLessonsPerDay(); i++) {
      _lessons.add(
        WeekviewLesson.useThisConstructor(
          hour: (_lessons[i - 1].startHour + 1),
          minute: _lessons[i - 1].startMinute + 0,
        ),
      );
    }
  }

  editLesson({
    required int index,
    required TimeOfDay tod,
  }) {
    var currentLesson = _lessons[index];
    if (tod.hour > currentLesson.startHour) {
      debugPrint(
          '[WeekviewBackend]: editLesson: la clase está siendo editada a mas ');
    } else if (tod.hour < currentLesson.startHour) {
      debugPrint(
          '[WeekviewBackend]: editLesson: la clase está siendo editada a menos');
    }
  }

  printLessons() {
    for (var i = 0; i < _lessons.length; i++) {
      debugPrint('$i: ${_lessons[i].toString()}');
    }
  }

  WeekviewLesson getWeekviewLesson(index) {
    return _lessons[index];
  }

  void sortLessons() {
    _lessons.sort();
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
  
  */

  void setLessonsPerDay(int lessonsPerDay) {
    if (lessonsPerDay < SettingsController().getLessonsPerDay()) {
      debugPrint('Hay que quitar WeekviewLessons');
      while (_lessons.length > lessonsPerDay) {
        _lessons.removeLast();
      }
      SettingsController().setLessonsPerDay(lessonsPerDay);
    } else if (lessonsPerDay > SettingsController().getLessonsPerDay()) {
      debugPrint('Hay que añadir WeekviewLessons');
      while (_lessons.length < lessonsPerDay) {
        WeekviewLesson h = WeekviewLesson(
            startHour: (_lessons.last.startHour + 1),
            startMinute: (_lessons.last.startMinute));
        _lessons.add(h);
      }
      SettingsController().setLessonsPerDay(lessonsPerDay);
    }
  }

  int getLessonsPerDay() {
    return SettingsController().getLessonsPerDay();
  }

  List<DateTime> getDatesForWeekView() {
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
}
