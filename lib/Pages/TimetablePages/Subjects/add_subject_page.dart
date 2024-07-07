// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/subject.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({super.key});
  @override
  State<AddSubjectPage> createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  var subject = MainController().getCurrentSubject();

  Future<void> buildHelpDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Asignaturas'),
            content: Text(
                'Las asignaturas son la base de tu Timetable. Elige un color, e introduce los datos relevantes. La abreviación no puede tener mas de 4 letras.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        });
  }

  buildDeleteButton() {
    return IconButton(
      onPressed: () => {
        MainController().deleteSubject(subject),
        Fluttertoast.showToast(msg: "Deleted ${subject.name}"),
        Navigator.pop(context),
      },
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      icon: Icon(Icons.delete),
    );
  }

  buildHelpButton() {
    return IconButton(
        onPressed: () => buildHelpDialog(), icon: Icon(Icons.info));
  }

  buildSaveButton() {
    late Icon a;
    if(subject.abv == ''){
      a = Icon(Icons.save);
    } else {
      a = Icon(Icons.save_as);
    }

    return IconButton(
        onPressed: () => {
              MainController().pushCurrentSubject(),
            },
        icon: a);
  }

  buildSubjectAppBar() {
    return AppBar(
      backgroundColor: colorToColor(subject.color),
      title: Text('Añadir Asignatura'),
      actions: [
        buildDeleteButton(),
        buildHelpButton(),
        buildSaveButton(),
      ],
    );
  }

  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  buildNameTextField() {
    myController.text = '';
    return TextField(
      controller: myController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
        hintStyle: TextStyle(color: Colors.grey[150]),
        hintText: ('Nombre de la Asignatura'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSubjectAppBar(),
      body: Column(
        children: [
          Container(
            child: buildNameTextField(),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          )
        ],
      ),
    );
  }
}
