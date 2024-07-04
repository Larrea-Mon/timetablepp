import 'package:objectbox/objectbox.dart';

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
