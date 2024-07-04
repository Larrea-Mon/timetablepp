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

    Card upcomingCard = Card(
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

    buildSubjectsCard() {
      var subjs = MainController().getAllSubjects();

      Card subjectsCard = Card(
        margin: const EdgeInsets.all(20.0),
        color: Colors.white,
        elevation: 2.0,
        child: Column(
          children: [
            AppBar(
              title: Text("Subjects"),
              actions: <Widget>[IconButton(onPressed: () => {a = MainController().getAllSubjects(), debugPrint(a.toString())}, icon: Icon(Icons.book))],
            ),
            SingleChildScrollView(
              child: Column(children:[
                for(int i = 0; i< subjs.length; i++)
                  ListTile(
                    title: Text('todo'),
                    //subtitle: Text('todo'),
                    subtitle: Text(subjs[i].name.toString()),
                  )
                
              ])
              /*child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subjs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("TODO $index"),
                  );
                },
              ),*/
            )
          ],
        ),
      );
      return subjectsCard;
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: dashboardAppBar,
      body: Column(
        children: [
          Center(
            child: upcomingCard,
          ),
         Expanded(
            child: Center(
              child: buildSubjectsCard(),
            ),
         ),
        ],
      ),
    );
  }
}
