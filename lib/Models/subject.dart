
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
