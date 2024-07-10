// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/Pages/TimetablePages/Subjects/materials_subject.dart';

class EditSubjectPage extends StatefulWidget {
  const EditSubjectPage({super.key});
  @override
  State<EditSubjectPage> createState() => _EditSubjectPageState();
}

class _EditSubjectPageState extends State<EditSubjectPage> {
  var subject = MainController().getCurrentSubject();

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
        onPressed: () => buildHelpDialog(context), icon: Icon(Icons.info));
  }

  buildSubjectAppBar() {
    return AppBar(
      backgroundColor: colorToColor(subject.color),
      title: Text(MainController().getCurrentSubject().name!),
      actions: [
        buildDeleteButton(),
        buildHelpButton(),
        buildSaveButton(context, Icon(Icons.save_as), nameController, abvController,
            teacherController, placeController, SubjectColors.apple.name),
      ],
    );
  }

  final nameController =
      TextEditingController(text: MainController().getCurrentSubject().name);
  final abvController =
      TextEditingController(text: MainController().getCurrentSubject().abv);
  final placeController =
      TextEditingController(text: MainController().getCurrentSubject().place);
  final teacherController =
      TextEditingController(text: MainController().getCurrentSubject().teacher);
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSubjectAppBar(),
      body: Column(
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
    );
  }
}
