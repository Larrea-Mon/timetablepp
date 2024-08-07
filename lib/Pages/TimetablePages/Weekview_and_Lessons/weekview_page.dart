// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/settings_controller.dart';

import 'package:timetablepp/Control/weekview_backend.dart';
import 'package:timetablepp/Pages/SettingsPages/Timetable/settings_weekview_times_page.dart';
import 'package:time_planner/time_planner.dart';
import 'package:timetablepp/Pages/TimetablePages/Weekview_and_Lessons/add_lesson_page.dart';

class WeekViewPage extends StatefulWidget {
  const WeekViewPage({super.key});

  @override
  State<WeekViewPage> createState() => _WeekViewPageState();
}

class _WeekViewPageState extends State<WeekViewPage> {
  late MyCustomGrid customGrid;
  @override
  void initState() {
    customGrid = MyCustomGrid();
    super.initState();
  }

  IconButton buildSettingsIconButton() {
    return IconButton(
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsTimesPage(),
          ),
        )
            .then(
          (_) => setState(() {}),
        )
            .then(
          (value) {
            Fluttertoast.showToast(
                msg: 'Recarga la página para ver tus cambios',
                backgroundColor: Colors.grey);
          },
        );
      },
      icon: Icon(Icons.settings),
    );
  }

  IconButton buildAddLessonIconButton() {
    return IconButton(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddLessonPage(),
          ),
        ).then((_) => setState(() {}));
      },
      icon: Icon(Icons.add_box),
    );
  }

  AppBar buildWeekViewAppBar() {
    return AppBar(
      title: Text('Vista Semanal'),
      actions: <Widget>[
        buildSettingsIconButton(),
        buildAddLessonIconButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildWeekViewAppBar(),
      body: customGrid,
    );
  }
}

class MyCustomGrid extends StatefulWidget {
  const MyCustomGrid({super.key});
  @override
  State<StatefulWidget> createState() => MyCustomGridState();
}

class MyCustomGridState extends State<MyCustomGrid> {
  //late List<TimePlannerTitle> headers;
  //late List<TimePlannerTask> tasks;
  @override
  void initState() {
    //headers = WeekviewBackend().getActiveDays();
    //tasks = WeekviewBackend().getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TimePlanner myTimePlanner = TimePlanner(
      startHour: SettingsController().getWeekviewStartTime(),
      endHour: SettingsController().getWeekviewEndTime(),
      use24HourFormat: true,
      headers: WeekviewBackend().getActiveDays(),
      tasks: WeekviewBackend().getTasks(),
      style:
          TimePlannerStyle(showScrollBar: true, cellWidth: 65, cellHeight: 65),
    );
    return myTimePlanner;
  }
}
