import 'package:objectbox/objectbox.dart';
import 'package:timetablepp/Models/subject.dart';

@Entity()
class Lesson {
  @Id()
  int id = 0;
  @Property(type: PropertyType.int)
  int hour = 0;
  @Property(type: PropertyType.int)
  int minute = 0;
  @Property(type: PropertyType.int)
  int day = 0;

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
