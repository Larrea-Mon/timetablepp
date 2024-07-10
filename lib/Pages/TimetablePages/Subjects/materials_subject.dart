// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/subject.dart';

Future<void> buildHelpDialog(context) {
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

buildSaveButton(
    context,
    Icon icon,
    TextEditingController nameController,
    TextEditingController abvController,
    TextEditingController teacherController,
    TextEditingController placeController,
    String color) {
  return IconButton(
    icon: icon,
    onPressed: () => {
      MainController().editCurrentSubject(
          nameController.text,
          abvController.text,
          teacherController.text,
          placeController.text,
          color),
      MainController().pushCurrentSubject(),
      Navigator.of(context).pop(),
    },
  );
}

buildHelpButton(context) {
  return IconButton(
      onPressed: () => buildHelpDialog(context), icon: Icon(Icons.info));
}

buildNameTextField(TextEditingController nameController) {
  return TextField(
    controller: nameController,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
      hintStyle: TextStyle(color: Colors.grey[150]),
      hintText: ('Nombre'),
    ),
  );
}

buildAbvTextField(TextEditingController abvController) {
  return TextField(
    controller: abvController,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
      hintStyle: TextStyle(color: Colors.grey[150]),
      hintText: ('Abreviación'),
    ),
  );
}

buildTeacherTextFieldRow(TextEditingController teacherController) {
  return Row(
    children: [
      Icon(
        Icons.co_present_outlined,
      ),
      Expanded(
        child: TextField(
          controller: teacherController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
            hintStyle: TextStyle(color: Colors.grey[150]),
            hintText: ('Profe'),
          ),
        ),
      ),
    ],
  );
}

buildPlaceTextFieldRow(TextEditingController placeController) {
  return Row(
    children: [
      Icon(Icons.place),
      Expanded(
        child: TextFormField(
          controller: placeController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
            hintStyle: TextStyle(color: Colors.grey[150]),
            hintText: ('Lugar'),
          ),
        ),
      ),
    ],
  );
}
