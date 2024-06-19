// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';

class AddHolidayPage extends StatefulWidget {
   AddHolidayPage({super.key});
  

    HolidayPeriod currentHP = HolidayPeriod(
      DateTime.timestamp(), DateTime.timestamp().add(const Duration(days: 2)), "");

  @override
  State<AddHolidayPage> createState() => _AddHolidayPageState();
}

class _AddHolidayPageState extends State<AddHolidayPage> {

  @override
  Widget build(BuildContext context) {
    AppBar holidayAddAppBar = AppBar(
      title: Text('Añadir Festivo'),
      backgroundColor: Colors.blue[100],
      actions: <Widget>[
        IconButton(
            onPressed: () {
              debugPrint(AddHolidayPage().currentHP.toString());
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
              children: [
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                    hintStyle: TextStyle(color: Colors.grey[150]),
                    hintText: ('Nombre del festivo'),
                  ),
                ),
              ],
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
      title: Text(dateToString(AddHolidayPage().currentHP.start)),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          AddHolidayPage().currentHP.start = pickedDate;
          setState(() {});
        } else {
          debugPrint("not selected");
        }
      }, //onTap
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
      title: Text(dateToString(AddHolidayPage().currentHP.end)),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          AddHolidayPage().currentHP.end = pickedDate;
          setState(() {});
        } else {
          debugPrint("not selected");
        }
      }, //onTap
    );
  }
}
