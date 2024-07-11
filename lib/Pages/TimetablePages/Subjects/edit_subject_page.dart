// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flex_color_picker/flex_color_picker.dart';
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
  // Color for the picker shown in Card on the screen.
  late Color screenPickerColor;
  // Color for the picker in a dialog using onChanged.
  late Color dialogPickerColor;
  // Color for picker using the color select dialog.
  late Color dialogSelectColor;

  @override
  void initState() {
    super.initState();
    screenPickerColor = MainController().getSubjectColorsMap[subject.color]; // Material blue.
    dialogPickerColor = Colors.red; // Material red.
    dialogSelectColor = const Color(0xFFA239CA); // A purple color.
  }

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
      backgroundColor: MainController().subjectColorsMap[subject.color]!,
      title: Text(MainController().getCurrentSubject().name!),
      actions: [
        buildDeleteButton(),
        buildHelpButton(),
        buildSaveButton(
            context,
            Icon(Icons.save_as),
            nameController,
            abvController,
            teacherController,
            placeController,
            SubjectColors.apple.name),
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
          ListTile(
            title: Text('Color de la asignatura.'),
            trailing: ColorIndicator(
              width: 44,
              height: 44,
              borderRadius: 22,
              color: screenPickerColor,
            ),
          ),
          Expanded(
            child: Card(
              elevation: 2,
              child: ColorPicker(
                pickersEnabled: const <ColorPickerType,bool>{
                  ColorPickerType.custom : true,
                  ColorPickerType.accent : false,  
                  ColorPickerType.primary : false,                       
                },
                
                color: MainController().subjectColorsMap[subject.color]!,
                onColorChanged: (Color color) =>
                    setState(() => screenPickerColor = color),
                width: 44,
                height: 44,
                borderRadius: 22,
                heading: Text(
                  'Select color',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
