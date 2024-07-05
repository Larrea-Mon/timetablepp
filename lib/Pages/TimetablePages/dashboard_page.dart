// ignore_for_file: prefer_const_constructors,unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/objectbox.g.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    List<Subject> a;
    AppBar dashboardAppBar = AppBar(
      title: Text('Main Page'),
      backgroundColor: Colors.blue[100],
    );

    buildUpcomingCard() {
      return Card(
        margin: const EdgeInsets.all(20.0),
        color: Colors.white,
        elevation: 2.0,
        child: ListTile(
          isThreeLine: true,
          title: Text("Upcoming"),
          subtitle: Text(
              "TODO overdue tasks, TODO due today, TODO due tomorrow\nTODO upcoming Tasks\nTODO upcoming exams"),
        ),
      );
    }

    buildSubjectsAppbar() {
      return AppBar(
        title: Text("Subjects"),
        actions: <Widget>[
          IconButton(
              onPressed: () => {
                    a = MainController().getAllSubjects(),
                    debugPrint(a.toString())
                  },
              icon: Icon(Icons.book))
        ],
      );
    }

    buildSubjectsTile(Subject subject) {
      return ListTile(
        title: Text(subject.name.toString()),
        subtitle: Text(
          subject.place + ' - ' + subject.teacher,
        ),
      );
    }

    buildSubjectsRow(Subject subject) {
      return Row(
        children: [
          SizedBox(
            height: 88,
            width: 30,
            child: ColoredBox(
              color: colorToColor(subject.color),
            ),
          ),
          //Container(height: 88, width: 50, color: Colors.green,),
          Expanded(
            child: buildSubjectsTile(subject),
          ),
        ],
      );
    }

    buildSubjectsCard() {
      var subjs = MainController().getAllSubjects();

      Card subjectsCard = Card(
        margin: const EdgeInsets.all(20.0),
        color: Colors.white,
        elevation: 2.0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSubjectsAppbar(),
              Column(
                children: [
                  for (int i = 0; i < subjs.length; i++)
                    buildSubjectsRow(subjs[i]),
                ],
              ),
            ],
          ),
        ),
      );
      return subjectsCard;
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: dashboardAppBar,
      body: Column(
        children: [
          buildUpcomingCard(),
          Expanded(
            child: buildSubjectsCard(),
          ),
        ],
      ),
    );
  }
}
