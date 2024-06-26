// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';

class AddHolidayPage extends StatefulWidget {
  const AddHolidayPage({super.key});

  @override
  State<AddHolidayPage> createState() => _AddHolidayPageState();
}

class _AddHolidayPageState extends State<AddHolidayPage> {

  final myController = TextEditingController();
  @override 
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myController.text = MainController().getCurrentHoliday().name;
    TextField nameTF = TextField(
      controller: myController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
        hintStyle: TextStyle(color: Colors.grey[150]),
        hintText: ('Nombre del festivo'),
      ),
    );
    AppBar holidayAddAppBar = AppBar(
      title: Text('Añadir Festivo'),
      backgroundColor: Colors.blue[100],
      actions: <Widget>[
        IconButton(
            onPressed: () {
              if ((MainController().getCurrentHoliday().end != null) &&
                  (MainController().getCurrentHoliday().start != null)) {
                if (!MainController()
                    .getCurrentHoliday()
                    .start!
                    .isAfter(MainController().getCurrentHoliday().end!)) {
                  MainController().pushCurrentHoliday(myController.text);
                  Navigator.pop(context);
                } else {
                  Fluttertoast.showToast(
                      msg:
                          "La fecha inicial debe ser anterior a la fecha final",
                      backgroundColor: Colors.grey);
                }
              } else {
                Fluttertoast.showToast(
                  msg: "El período festivo debe tener comienzo y final",
                  backgroundColor: Colors.grey,
                );
              }
            },
            icon: Icon(Icons.save))
      ],
    );

    return Scaffold(
        appBar: holidayAddAppBar,
        body: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 100,
              children: [nameTF],
            ),
            HolidayDateStartPicker(),
            HolidayDateEndPicker(),
          ],
        ));
  }
}

class HolidayDateStartPicker extends StatefulWidget {
  const HolidayDateStartPicker({super.key});
  final String startDate = '-';
  @override
  State<HolidayDateStartPicker> createState() => HolidayDateStartPickerState();
}

class HolidayDateStartPickerState extends State<HolidayDateStartPicker> {
  String startDate = '-';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text(MainController().getCurrentHoliday().getStartAsString()),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025));

        if (pickedDate != null) {
          //debugPrint(pickedDate.toString());
          MainController().getCurrentHoliday().setStart(pickedDate);
          setState(() {});
        } else {
          debugPrint("not selected");
        }
      },
    );
  }
}

class HolidayDateEndPicker extends StatefulWidget {
  const HolidayDateEndPicker({super.key});
  final String endDate = '-';
  @override
  State<HolidayDateEndPicker> createState() => HolidayDateEndPickerState();
}

class HolidayDateEndPickerState extends State<HolidayDateEndPicker> {
  String endDate = '-';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.calendar_month_outlined),
      title: Text(MainController().getCurrentHoliday().getEndAsString()),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025));

        if (pickedDate != null) {
          //debugPrint(pickedDate.toString());
          MainController().getCurrentHoliday().setEnd(pickedDate);
          setState(() {});
        } else {
          debugPrint("not selected");
        }
      },
    );
  }
}
