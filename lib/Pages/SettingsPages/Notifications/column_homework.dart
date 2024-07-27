// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/settings_controller.dart';

class HomeworkNotifsTilesColumn extends StatefulWidget {
  const HomeworkNotifsTilesColumn({super.key});
  @override
  State<HomeworkNotifsTilesColumn> createState() =>
      _HomeworkNotifsTilesColumnState();
}

class _HomeworkNotifsTilesColumnState
    extends State<HomeworkNotifsTilesColumn> {
  late bool enabled;
  late int homeworkAfterClassTime;
  late TimeOfDay homeworkFreeDayTime;
  late int homeworkNotificationsDay;

  @override
  void initState() {
    homeworkAfterClassTime =
        SettingsController().getTimeSendNotifsHomeworkAfterClass();
    homeworkFreeDayTime = SettingsController().getTimeNotifsHomeworkFreeDays();
    homeworkNotificationsDay = SettingsController().getDaysSendNotifsNextHomework();
    enabled = SettingsController().getSendNotifsNextHomework();
    super.initState();
  }

  late ListTile myFirstTile;
  late ListTile mySecondTile;
  late ListTile myThirdTile;
  late SwitchListTile mySwitchListTile;

  @override
  Widget build(BuildContext context) {
    var myFirstController = TextEditingController(
        text: SettingsController()
            .getTimeSendNotifsHomeworkAfterClass()
            .toString());
    myFirstTile = ListTile(
      enabled: SettingsController().getSendNotifsNextHomework(),
      title: Text('Mandar el recordatorio después de clase.'),
      subtitle:
          Text('$homeworkAfterClassTime minutos después de la última clase'),
      onTap: () {
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
                      hintText: ('Minutos después de clase.'),
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
                          SettingsController()
                              .setTimeSendNotifsHomeworkAfterClass(
                                  num.parse(myFirstController.text).toInt());
                          setState(() {
                            homeworkAfterClassTime =
                                num.parse(myFirstController.text).toInt();
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Ok'),)
                ],
              );
            });
      },
    );
    //FIRSTTILE ACABA AQUI
    mySecondTile = ListTile(
      enabled: SettingsController().getSendNotifsNextHomework(),
      title: Text('Mandar el recordatorio los días libres.'),
      subtitle: Text('Recordatorio a las ${toDtoString(homeworkFreeDayTime)}'),
      onTap: () async {
        TimeOfDay? pickedTime = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return TimePickerDialog(
              initialTime: SettingsController().getTimeNotifsHomeworkFreeDays(),
              initialEntryMode: TimePickerEntryMode.dial,
            );
          },
        );
        if (pickedTime != null) {
          SettingsController().setTimeNotifsHomeworkFreeDays(pickedTime);
          setState(() {
            homeworkFreeDayTime = pickedTime;
          });
        }
      },
    );
    //SECONDTILE ACABA AQUI
    var myThirdController = TextEditingController(
        text: SettingsController()
            .getDaysSendNotifsNextHomework()
            .toString());

    myThirdTile = ListTile(
      enabled: SettingsController().getSendNotifsNextHomework(),
      title: Text('Mandar el recordatorio con antelación.'),
      subtitle: Text('$homeworkNotificationsDay días antes de la entrega'),
      onTap: () {
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
                    controller: myThirdController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                      hintStyle: TextStyle(color: Colors.grey[150]),
                      hintText: ('Días antes de la entrega.'),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        if ((myThirdController.text == '') ||
                            (myThirdController.text.trim() == '0')) {
                          Fluttertoast.showToast(
                              msg: 'Debe de haber un número mayor que 0.',
                              backgroundColor: Colors.grey);
                        } else {
                          SettingsController()
                              .setDaysSendNotifsNextHomework(
                                  num.parse(myThirdController.text).toInt());
                          setState(() {
                            homeworkNotificationsDay =
                                num.parse(myThirdController.text).toInt();
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
    //THIRDTILE ACABA AQUI

    mySwitchListTile = SwitchListTile(
      title: Text('Recordatorio de Tareas'),
      value: enabled,
      onChanged: (bool? value) => {
        SettingsController().setSendNotifsNextHomework(value!),
        setState(() {
          enabled = value;
        }),
      },
    );

    return Column(
      children: [
        mySwitchListTile,
        myFirstTile,
        mySecondTile,
        myThirdTile,
      ],
    );
  }
}
