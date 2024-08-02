// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/weekview_backend.dart';
import 'package:timetablepp/Pages/SettingsPages/Timetable/settings_weekview_times_page.dart';

class WeekViewPage extends StatefulWidget {
  const WeekViewPage({super.key});

  @override
  State<WeekViewPage> createState() => _WeekViewPageState();
}

class _WeekViewPageState extends State<WeekViewPage> {
  @override
  Widget build(BuildContext context) {
    AppBar weekViewAppBar = AppBar(
      title: Text('Vista Semanal'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsTimesPage(),
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
        IconButton(
          onPressed: () {
            todoButton();
            WeekviewBackend().printLessons();
          },
          icon: Icon(Icons.add_box),
        )
      ],
    );

    return Scaffold(
      appBar: weekViewAppBar,
      /*body: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(),
        childrenDelegate: SliverChildBuilderDelegate(),
      ),*/
    );
  }
}
