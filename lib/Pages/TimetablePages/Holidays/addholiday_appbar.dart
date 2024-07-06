// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';

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
