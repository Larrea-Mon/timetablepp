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
  late List<WeekviewLesson> lessons;

  void pushLessons() {
    DatabaseController().putAllLessons(lessons);
  }

  initLessons() {
    lessons = DatabaseController().getAllWeekviewLessons();
    if (lessons.isEmpty) {
      debugPrint('[WeekviewBackend]: Lessons Is Empty');
      generateLessonsFromZero();
    } else if (lessons.length < SettingsController().getLessonsLength()) {
      debugPrint(
          '[WeekviewBackend]: Hay menos Lessons de las que debería haber');
    }
  }

  generateLessonsFromZero() {
    lessons.add(WeekviewLesson.useThisConstructor(hour: 8, minute: 0));
    int first = SettingsController().getLessonsLength();
    int second = SettingsController().getLessonsBreak();
    for (var i = 1; i < 20; i++) {
      int total = first + second;
      int hours = total ~/ 60;
      int minutes = total % 60;
      lessons.add(
        WeekviewLesson.useThisConstructor(
          hour: (lessons[i - 1].startHour + hours),
          minute: lessons[i - 1].startMinute + minutes,
        ),
      );
    }
  }

  editLesson({
    required int index,
    required TimeOfDay tod,
  }) {
    var currentLesson = lessons[index];
    if (tod.hour > currentLesson.startHour) {
      debugPrint(
          '[WeekviewBackend]: editLesson: la clase está siendo editada a mas ');
    } else if (tod.hour < currentLesson.startHour) {
      debugPrint(
          '[WeekviewBackend]: editLesson: la clase está siendo editada a menos');
    }
  }

  printLessons() {
    for (var i = 0; i < lessons.length; i++) {
      debugPrint('$i: ${lessons[i].toString()}');
    }
  }

  getListTile(int index) {
    return ListTile(
      title: Text('Clase ${index + 1}'),
      subtitle: Text('${toDtoString(lessons[index].getTimeOfDay())}'),
      onTap: () {
        //editLesson(index: index, tod: tod)
      },
    );
  }

  int getLessonsLength() {
    return SettingsController().getLessonsLength();
  }

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
      
    }

  }

  void setLessonsBreak(int int) {}

  void setLessonsPerDay(int int) {}

  int getLessonsPerDay() {
    return SettingsController().getLessonsPerDay();
  }

  int getLessonsBreak() {
    return SettingsController().getLessonsBreak();
  }
}
