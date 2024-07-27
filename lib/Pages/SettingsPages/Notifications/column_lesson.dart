// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/settings_controller.dart';

class LessonNotifsTilesPackage extends StatefulWidget {
  const LessonNotifsTilesPackage({super.key});
  @override
  State<LessonNotifsTilesPackage> createState() =>
      LessonNotifsTilesPackageState();
}

class LessonNotifsTilesPackageState extends State<LessonNotifsTilesPackage> {
  late bool asdas;
  late int time;

  @override
  void initState() {
    asdas = SettingsController().getSendNotifsNextLesson();
    time = SettingsController().getTimeSendNotifsNextLesson();
    super.initState();
  }

  late ListTile myTile;
  late SwitchListTile mySwitchListTile;

  @override
  Widget build(BuildContext context) {
    var myController = TextEditingController(
        text: SettingsController().getTimeSendNotifsNextLesson().toString());
    myTile = ListTile(
      enabled: SettingsController().getSendNotifsNextLesson(),
      title: Text('Mandar la notificación con antelación.'),
      subtitle: Text('$time minutos antes de clase'),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 80,
                  width: BorderSide.strokeAlignCenter,
                  child: TextField(
                    //TODO volver a esto con un FORM
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: myController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                      hintStyle: TextStyle(color: Colors.grey[150]),
                      hintText: ('Minutos antes de clase.'),
                    ),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        if ((myController.text == '') ||
                            (myController.text.trim() == '0')) {
                          Fluttertoast.showToast(
                              msg: 'Debe de haber un número mayor que 0.',
                              backgroundColor: Colors.grey);
                        } else {
                          SettingsController().setTimeSendNotifsNextLesson(
                              num.parse(myController.text).toInt());
                          setState(() {
                            time = num.parse(myController.text).toInt();
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Ok'))
                ],
              );
            });
      },
    );
    mySwitchListTile = SwitchListTile(
      title: Text('Notificación antes de clase'),
      value: asdas,
      onChanged: (bool? value) => {
        SettingsController().setSendNotifsNextLesson(value!),
        setState(() {
          asdas = value;
        }),
      },
    );

    return Column(
      children: [
        mySwitchListTile,
        myTile,
      ],
    );
  }
}
