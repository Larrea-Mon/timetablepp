import 'dart:ffi';


//The event class corresponds to one-time events. They can have an associated subject, or they can be standalone
//TODO notifs

class Event {
  String name;
  DateTime date;
  String notes;
  Float percentage;
  String type;

  Event(this.name, this.date, this.notes, this.percentage, this.type);
}