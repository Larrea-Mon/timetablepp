import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Subject {
  @Id()
  int id = 0;

  String? name;
  String? abv;

  String? teacher;
  String? place;
  String color = 'sky';

  Subject(this.name, this.abv, this.teacher, this.place, this.color);

  @override
  String toString() {
    return 'Subject:[ID:$id],$name,$abv,$teacher,$place,$color';
  }
}

Color colorToColor(String color) {
  if (color == 'sky') {
    return Colors.blue[200]!;
  } else if (color == 'river') {
    return Colors.blue[700]!;
  } else if (color == 'grass') {
    return Colors.green[200]!;
  } else if (color == 'forest') {
    return Colors.green[700]!;
  } else if (color == 'sun') {
    return Colors.yellow[600]!;
  } else if (color == 'orange') {
    return Colors.orange[600]!;
  }else if (color == 'pink') {
    return Colors.pink[300]!;
  }else if (color == 'apple') {
    return Colors.red[600]!;
  }else if (color == 'lila') {
    return Colors.purple[400]!;
  }else if (color == 'purple') {
    return Colors.purple[600]!;
  }else if (color == 'chocolate') {
    return Colors.brown[400]!;
  } else if(color == 'wood') {
    return Colors.brown[700]!;
  } else {
    return Colors.black;
  }
}

enum SubjectColors {
  sky,
  river,
  grass,
  forest,
  sun,
  orange,
  pink,
  apple,
  lila,
  purple,
  chocolate,
  wood
}
