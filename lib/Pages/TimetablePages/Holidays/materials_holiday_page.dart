// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/subject.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Periodo de vacaciones.'),
          content: Text(
              'Durante un periodo de vacaciones, Timetable++ no te mandará notificaciones de ir a clase.\nLa aplicación te seguirá mandando notificaciones de entregas y exámenes.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'))
          ],
        );
      });
}

IconButton deleteButton(context) {
  var a = MainController().getCurrentHoliday().getName();

  return IconButton(
      onPressed: () => {
            Fluttertoast.showToast(
                msg: "Deleted $a.", backgroundColor: Colors.grey),
            MainController().deleteCurrentHoliday(),
            Navigator.pop(context)
          },
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      icon: Icon(Icons.delete));
}

IconButton helpButton(context) {
  return IconButton(
      onPressed: () => dialogBuilder(context),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      icon: Icon(Icons.info));
}

buildSaveHolidayIcon(TextEditingController myController, Icon icon, context) {
      return IconButton(
        icon: icon,
        onPressed: () {
          if ((MainController().getCurrentHoliday().end != null) &&
              (MainController().getCurrentHoliday().start != null)) {
            if (!MainController()
                .getCurrentHoliday()
                .start!
                .isAfter(MainController().getCurrentHoliday().end!)) {
              if (myController.text.trim().isNotEmpty) {
                MainController().pushCurrentHoliday(myController.text);
                Navigator.pop(context);
              } else {
                Fluttertoast.showToast(
                    msg: "El festivo debe tener nombre.",
                    backgroundColor: Colors.grey);
              }
            } else {
              Fluttertoast.showToast(
                  msg: "La fecha inicial debe ser anterior a la fecha final",
                  backgroundColor: Colors.grey);
            }
          } else {
            Fluttertoast.showToast(
              msg: "El período festivo debe tener comienzo y final",
              backgroundColor: Colors.grey,
            );
          }
        },
      );
    }