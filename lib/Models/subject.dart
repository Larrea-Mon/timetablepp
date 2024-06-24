import 'package:objectbox/objectbox.dart';


//TODO poner el @Entity cuando sea el momento
class Subject {
  @Id()
  int id = 0;

  @Property(type: PropertyType.char)
  String name = '';
  @Property(type: PropertyType.char)
  String abv = '';
  @Property(type: PropertyType.char)
  String teacher = '';
  @Property(type: PropertyType.char)
  String place = '';

  @Transient()
  SubjectColors? color;
  
  int? get dbColor {
    _ensureStableEnumValues();
    return color?.index;
  }

   set dbColor(int? value){
    _ensureStableEnumValues();
    if (value == null){
      color = null;
    } else {
      color =  SubjectColors.values[value];
    }
  }


  Subject(String name, String abv, String teacher, String place, SubjectColors color);


  void _ensureStableEnumValues(){
    assert(SubjectColors.cyan.index == 0);
    assert(SubjectColors.blue.index == 1);
    assert(SubjectColors.grass.index == 2);
    assert(SubjectColors.forest.index == 3);
    assert(SubjectColors.yellow.index == 4);
    assert(SubjectColors.orange.index == 5);
    assert(SubjectColors.pink.index == 6);
    assert(SubjectColors.red.index == 7);
    assert(SubjectColors.lila.index == 8);
    assert(SubjectColors.purple.index == 9);
    assert(SubjectColors.chocolate.index == 10);
    assert(SubjectColors.chocolate.index == 11);
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
