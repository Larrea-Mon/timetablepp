// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';

class AddHolidayPage extends StatefulWidget {
  const AddHolidayPage({super.key});

  @override
  State<AddHolidayPage> createState() => _AddHolidayPageState();
}

class _AddHolidayPageState extends State<AddHolidayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: dayViewAppBar,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLength: 64,
                    maxLengthEnforcement:
                      MaxLengthEnforcement.truncateAfterCompositionEnds,

                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.calendar_today),
                Expanded(
                  child: TextField()
                  ),
              ],
            )
          ],
        ));
  }
}

AppBar dayViewAppBar = AppBar(
  title: Text('Añadir Festivo'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
