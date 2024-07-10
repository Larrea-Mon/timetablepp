// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/Pages/TimetablePages/Subjects/materials_subject.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({super.key});
  @override
  State<AddSubjectPage> createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  var subject = MainController().getCurrentSubject();

  final nameController = TextEditingController(text: '');
  final abvController = TextEditingController(text: '');
  final placeController = TextEditingController(text: '');
  final teacherController = TextEditingController(text: '');

  buildSubjectAppBar() {
    return AppBar(
      backgroundColor: colorToColor(subject.color),
      title: Text('Añadir Asignatura'),
      actions: [
        buildHelpButton(context),
        buildSaveButton(context, Icon(Icons.save), nameController, abvController,
            teacherController, placeController, SubjectColors.apple.name),
      ],
    );
  }

    
  @override
  void dispose() {
    nameController.dispose();
    abvController.dispose();
    placeController.dispose();
    teacherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSubjectAppBar(),
      body: Form(
        child: Column(
          children: [
            Container(
              child: buildNameTextField(nameController),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
            Container(
              child: buildAbvTextField(abvController),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
            Container(
              child: buildTeacherTextFieldRow(teacherController),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
            Container(
              child: buildPlaceTextFieldRow(placeController),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
          ],
        ),
      ),
    );
  }
}
