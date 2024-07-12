// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flex_color_picker/flex_color_picker.dart';
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
  var dialogPickerColor = MainController().getSubjectColorsMap['sky'];

  buildSubjectAppBar() {
    return AppBar(
      backgroundColor: dialogPickerColor,
      title: Text('Añadir Asignatura'),
      actions: [
        buildHelpButton(context),
        buildSaveButton(
            context,
            Icon(Icons.save),
            nameController,
            abvController,
            teacherController,
            placeController,
            SubjectColors.apple.name),
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

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) => {
        setState(
          () => dialogPickerColor = color,
        ),
      },

      width: 40,
      height: 40,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      //heading: Text('Select Color'),
      enableShadesSelection: false,
      //showMaterialName: true,
      //showColorName: true,
      //showColorCode: true,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: false,
        ColorPickerType.customSecondary: false,
      },
      customColorSwatchesAndNames: MainController().generateColorSwatchMap(),
    ).showPickerDialog(
      context,
      transitionBuilder: (BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget widget) {
        final double curvedValue =
            Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(opacity: a1.value, child: widget),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints:
          const BoxConstraints(minHeight: 160, minWidth: 300, maxWidth: 320),
    );
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
            ListTile(
              title: Text('Color de la asignatura.'),
              trailing: ColorIndicator(
                onSelectFocus: false,
                onSelect: () async {
                  //ESTO es para cuando le dan patrá
                  final Color colorBeforeDialog = dialogPickerColor;

                  if (!(await colorPickerDialog())) {
                    setState(() {
                      dialogPickerColor = colorBeforeDialog;
                    });
                  }
                },
                width: 44,
                height: 44,
                borderRadius: 22,
                color: dialogPickerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
