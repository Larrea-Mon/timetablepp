// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/weekview_backend.dart';
import 'package:timetablepp/Pages/SettingsPages/Timetable/settings_weekview_times_page.dart';
//import 'package:flutter_week_view/flutter_week_view.dart';

class WeekViewPage extends StatefulWidget {
  const WeekViewPage({super.key});

  @override
  State<WeekViewPage> createState() => _WeekViewPageState();
}

class _WeekViewPageState extends State<WeekViewPage> {
  @override
  void initState() {
    super.initState();
  }

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
      body: MyCustomGrid(),
    );
  }
}

class MyCustomGrid extends StatefulWidget {
  const MyCustomGrid({super.key});
  @override
  State<StatefulWidget> createState() => MyCustomGridState();
}

class MyCustomGridState extends State<MyCustomGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    List<DateTime> dates = WeekviewBackend().getDatesForWeekView();
    //WeekView myWeekView = WeekView(dates: dates,);
    return myWeekView;
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
