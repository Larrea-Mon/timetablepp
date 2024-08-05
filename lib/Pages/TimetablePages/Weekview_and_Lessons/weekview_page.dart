// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:timetablepp/Control/weekview_backend.dart';
import 'package:timetablepp/Pages/SettingsPages/Timetable/settings_weekview_times_page.dart';
//import 'package:flutter_week_view/flutter_week_view.dart';
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

  @override
  Widget build(BuildContext context) {
    AppBar weekViewAppBar = AppBar(
      title: Text('Vista Semanal'),
      actions: <Widget>[
        IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsTimesPage(),
              ),
            ).then(
              (_) => setState(() {
                customGrid = MyCustomGrid();
              }),
            ),
          },
          icon: Icon(Icons.settings),
        ),
        IconButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddLessonPage(),
              ),
            );
            ((_) => setState(() {}));
          },
          icon: Icon(Icons.add_box),
        )
      ],
    );

    return Scaffold(
      appBar: weekViewAppBar,
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
  late List<TimePlannerTitle> headers;
  late List<TimePlannerTask> tasks;
  @override
  void initState() {
    headers = WeekviewBackend().getActiveDays();
    tasks = WeekviewBackend().getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    // List<DateTime> dates = WeekviewBackend().getDatesForWeekView();
    //WeekView myWeekView = WeekView(dates: dates,);

    TimePlanner myTimePlanner = TimePlanner(
      startHour: 8,
      endHour: 23,
      use24HourFormat: true,
      headers: headers,
      tasks: tasks,
      style: TimePlannerStyle(
        showScrollBar: true,
        cellWidth: 65,
      ),
    );
    return myTimePlanner;
    //TODO Volver a esto en otro momento.
    /*return GridView.custom(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 60,),
      childrenDelegate: SliverChildBuilderDelegate((context, index) => ,),

      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,

      
    );
    */
  }
}
