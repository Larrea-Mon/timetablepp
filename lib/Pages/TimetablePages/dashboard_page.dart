// ignore_for_file: prefer_const_constructors,unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/Pages/TimetablePages/Subjects/add_subject_page.dart';
import 'package:timetablepp/objectbox.g.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
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

    buildNewSubjectIconButton() {
      return IconButton(
          onPressed: () => {
                MainController().resetCurrentSubject(),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddSubjectPage(),
                  ),
                ).then((_) => setState(() {}))
              },
          icon: Icon(Icons.book));
    }

    buildSubjectsAppbar() {
      return AppBar(
        title: Text("Subjects"),
        actions: <Widget>[
          buildNewSubjectIconButton(),
        ],
      );
    }

    buildSubjectsTile(Subject subject) {
      return ListTile(
        onTap: () {
          debugPrint('Soy una Tile y mi Subject es [$subject]');
          MainController().setCurrentSubject(subject);
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddSubjectPage()))
              .then((_) => setState(() {}));
        },
        title: Text(subject.name.toString()),
        subtitle: Text(
          '${subject.place} - ${subject.teacher}',
        ),
      );
    }

    buildSubjectsRow(Subject subject) {
      return Row(
        children: [
          SizedBox(
            height: 72,
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

    buildSubjectsCardNew() {
      var subjs = MainController().getAllSubjects();

      Card subjectsCard = Card(
        margin: const EdgeInsets.all(20.0),
        color: Colors.white,
        elevation: 2.0,
        child: Scaffold(
          appBar: buildSubjectsAppbar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < subjs.length; i++)
                  buildSubjectsRow(subjs[i]),
                //Divider(height: 1,),
              ],
            ),
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
            child: buildSubjectsCardNew(),
          ),
        ],
      ),
    );
  }
}
