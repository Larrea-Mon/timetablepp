// ignore_for_file: empty_constructor_bodies

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:timetablepp/objectbox.g.dart';
//TODO Mirar Esto


class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store){

  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path,"obx-example"));
    return ObjectBox._create(store);
  }
}

