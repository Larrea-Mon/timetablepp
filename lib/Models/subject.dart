import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';



@Entity()
class Subject {
  @Id()
  int id = 0;

  String name;
  String abv;

  String teacher;
  String place;
  String color;

  Subject(this.name, this.abv, this.teacher, this.place, this.color);

  @override
  String toString() {
    return 'Subject:$name,$abv,$teacher,$place,$color';
  }
}

Color colorToColor(String color){
  if (color == 'cyan') {
    return Colors.blue[200]!;
  } else if (color == 'blue'){ 
    return Colors.blue[700]!;
  } else if(color == 'grass'){
    return Colors.green[200]!;
  } else if (color == 'forest'){
    return Colors.green[700]!;
  } else {
    return Colors.black;
  }
}

enum SubjectColors {
  cyan,
  blue,
  grass,
  forest,
  yellow,
  orange,
  pink,
  red,
  lila,
  purple,
  chocolate,
  brown
}