import 'package:objectbox/objectbox.dart';

//The event class corresponds to one-time events. They can have an associated subject, or they can be standalone
//TODO notifs
// TODO @Entity()
class Event {
  @Id()
  int id = 0;
  String name;
  String notes;
  String type;
  
  @Property(type: PropertyType.date)
  DateTime date;

  @Property(type: PropertyType.float)
  double percentage;

  Event(this.name, this.date, this.notes, this.percentage, this.type);
}
