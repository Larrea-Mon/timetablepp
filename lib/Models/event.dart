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
  
  DateTime date;



  Event({required this.name, required this.date, required this.notes, required this.type});
}
