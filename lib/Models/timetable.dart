//TIMETABLE es la clase que contiene todas las clases.
//La usuaria puede tener más de una timetable, pero sólo una está activa a la vez.
import 'package:objectbox/objectbox.dart';
import 'package:timetablepp/Models/event.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/Models/termperiod.dart';

//TODO poner el @Entity() cuando sea el momento
class Timetable {
  @Id()
  int id = 0;

  @Property(type: PropertyType.char)
  String name = '';
  @Transient()
  List<Subject> list = List.empty(growable: true);
  @Transient()
  TermPeriod term = TermPeriod(start: null, end: null);
  @Transient()
  List<HolidayPeriod> holidays = List.empty(growable: true);
  @Transient()
  List<Event> events = List.empty(growable: true);

  Timetable(this.name);
}
