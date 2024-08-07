// ignore_for_file:  prefer_final_fields, prefer_const_constructors, unused_field

import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/lesson.dart';
import 'package:timetablepp/Models/settingsbatch.dart';
import 'package:timetablepp/Models/termperiod.dart';

import '../Models/subject.dart';
import '../objectbox.g.dart';

import '../main.dart';

class DatabaseController {
  DatabaseController._privateConstructor();

  static final DatabaseController _instance =
      DatabaseController._privateConstructor();
  factory DatabaseController() {
    return _instance;
  }

  final Box<HolidayPeriod> _holidaysBox = objectbox.store.box<HolidayPeriod>();
  final Box<TermPeriod> _termPeriodBox = objectbox.store.box<TermPeriod>();
  final Box<Subject> _subjectBox = objectbox.store.box<Subject>();
  final Box<SettingsBatch> _settingsBox = objectbox.store.box<SettingsBatch>();
  final Box<Lesson> _lessonsBox = objectbox.store.box<Lesson>();
  // TERMPERIOD
  TermPeriod getTermPeriod(int id) {
    var result = _termPeriodBox.get(id);
    if (result != null) {
      return result;
    } else {
      return TermPeriod(start: null, end: null);
    }
  }

  void putTermPeriod(TermPeriod termPeriod) {
    _termPeriodBox.put(termPeriod);
  }

  // TERMPERIOD
  //term period sólo necesita estas dos
  //SETTINGSBATCH

  SettingsBatch getSettingsBatch() {
    var result = _settingsBox.get(1);
    if (result != null) {
    } else {
      result = SettingsBatch();
    }
    return result;
  }

  void setSettingsBatch(SettingsBatch settings) {
    _settingsBox.put(settings);
  }
  //SETTINGSBATCH
  //SettingsBatch también solo necesita estas dos.

  //SUBJECT
  Subject getSubject(int id) {
    var result = _subjectBox.get(id);
    if (result != null) {
      return result;
    } else {
      return Subject(
          name: '',
          abv: '',
          place: '',
          teacher: '',
          color: SubjectColors.sky.name);
    }
  }

  void putSubject(Subject subject) {
    _subjectBox.put(subject);
  }

  void removeSubject(int id) {
    _subjectBox.remove(id);
  }

  List<Subject> getAllSubjects() {
    return _subjectBox.getAll();
  }

  int deleteAllSubjects() {
    return _subjectBox.removeAll();
  }

  //SUBJECT
  //HOLIDAYS
  HolidayPeriod getHolidayPeriod(int id) {
    var result = _holidaysBox.get(id);
    if (result != null) {
      return result;
    } else {
      return HolidayPeriod(start: null, end: null, name: '');
    }
  }

  void putHolidayPeriod(HolidayPeriod holidayPeriod) {
    _holidaysBox.put(holidayPeriod);
  }

  void removeHolidayPeriod(int id) {
    _holidaysBox.remove(id);
  }

  List<HolidayPeriod> getAllHolidayPeriods() {
    return _holidaysBox.getAll();
  }

  int deleteHolidays() {
    return _holidaysBox.removeAll();
  }

  //Holidays
  //LESSON EMPIEZA AQUI
  Lesson getLesson(int id) {
    var result = _lessonsBox.get(id);
    if (result != null) {
      return result;
    } else {
      throw Exception(
          '[DatabaseController]: getLesson(): La lección $id no existe');
    }
  }

  void putLesson(Lesson lesson) {
    _lessonsBox.put(lesson);
  }

  bool removeLesson(int id) {
    bool result = _lessonsBox.remove(id);
    return result;
  }

  List<Lesson> getAllLessons() {
    var result = _lessonsBox.getAll();
    return result;
  }

  List<Lesson> getActiveLessons() {
    var lessons = getAllLessons();

    if (SettingsController().getIsMondayActive() == false) {
      lessons.removeWhere((item) => item.day == 1);
    }
    if (SettingsController().getIsTuesdayActive() == false) {
      lessons.removeWhere((item) => item.day == 2);
    }
    if (SettingsController().getIsWednesdayActive() == false) {
      lessons.removeWhere((item) => item.day == 3);
    }
    if (SettingsController().getIsThursdayActive() == false) {
      lessons.removeWhere((item) => item.day == 4);
    }
    if (SettingsController().getIsFridayActive() == false) {
      lessons.removeWhere((item) => item.day == 5);
    }
    if (SettingsController().getIsSaturdayActive() == false) {
      lessons.removeWhere((item) => item.day == 6);
    }
    if (SettingsController().getIsSundayActive() == false) {
      lessons.removeWhere((item) => item.day == 7);
    }
    return lessons;
  }

  int deleteAllLessons() {
    return _lessonsBox.removeAll();
  }

  //LESSON ACABA AQUI

  //WeekviewLesson
  /*EN DESUSO TOTAL 
  WeekviewLesson getWeekviewLesson(int id) {
    return _weekviewBox.get(id)!;
  }

  void putWeekviewLesson(WeekviewLesson weekviewLesson) {
    _weekviewBox.put(weekviewLesson);
  }

  bool removeWeekviewLesson(int id) {
    return _weekviewBox.remove(id);
  }

  List<WeekviewLesson> getAllWeekviewLessons() {
    var lessons = _weekviewBox.getAll();

    return lessons;
  }

  int deleteAllWeekviewLessons() {
    return _weekviewBox.removeAll();
  }
  void putAllLessons(List<WeekviewLesson> lessons){
    _weekviewBox.putMany(lessons);
  }
*/
//WeekviewLesson
}
