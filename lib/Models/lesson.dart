import 'package:objectbox/objectbox.dart';
import 'package:timetablepp/Models/subject.dart';

//TODO poner @Entity()
class Lesson {
  @Id()
  int id = 0;
  @Property(type: PropertyType.int)
  int hour = 0;
  @Property(type: PropertyType.int)
  int minute = 0;

  late Days day;
  
  final subject = ToOne<Subject>();
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
