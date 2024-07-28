// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';

class ExamNotifsTilesColumn extends StatefulWidget {
  const ExamNotifsTilesColumn({super.key});
  @override
  State<ExamNotifsTilesColumn> createState() => _ExamNotifsTilesColumnState();
}

class _ExamNotifsTilesColumnState extends State<ExamNotifsTilesColumn> {
  late bool enabled;
  late int examDays;

  @override
  void initState() {
    enabled = SettingsController().getSendNotifsNextExam();
    examDays = SettingsController().getDaysSendNotifsNextExam();
    super.initState();
  }

  late SwitchListTile mySwitchTile;
  late ListTile myFirstTile;

  @override
  Widget build(BuildContext context) {
    mySwitchTile = SwitchListTile(
      title: Text('Recordatorio de Examen'),
      value: enabled,
      onChanged: (bool? value) {
        SettingsController().setSendNotifsNextExam(value!);
        setState(() {
          enabled = value;
        });
      },
    );
    TextEditingController myFirstController =
        TextEditingController(text: '$examDays');
    myFirstTile = ListTile(
      enabled: enabled,
      title: Text('Mandar el recordatorio con antelación.'),
      subtitle: Text('$examDays días de antelación'),
      onTap: () {
        setState(
          () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog.adaptive(
                  content: SizedBox(
                    height: 80,
                    width: BorderSide.strokeAlignCenter,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: myFirstController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                        hintStyle: TextStyle(color: Colors.grey[150]),
                        hintText: ('Días antes del examen.'),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if ((myFirstController.text == '') ||
                            (myFirstController.text.trim() == '0')) {
                          Fluttertoast.showToast(
                              msg: 'Debe de haber un número mayor que 0.',
                              backgroundColor: Colors.grey);
                        } else {
                          SettingsController().setDaysSendNotifsNextExam(
                              num.parse(myFirstController.text).toInt());
                          setState(() {
                            examDays =
                                num.parse(myFirstController.text).toInt();
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
    return Column(
      children: [
        mySwitchTile,
        myFirstTile,
      ],
    );
  }
}
