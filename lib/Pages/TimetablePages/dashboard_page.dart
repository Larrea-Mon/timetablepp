// ignore_for_file: prefer_const_constructors,unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

      /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
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

    Card subjectsCard = Card(
      margin: const EdgeInsets.all(20.0),
      color: Colors.white,
      elevation: 2.0,
      child: Column(
        children: [
          AppBar(
            title: Text("Subjects"),
          ),
          SingleChildScrollView(
            child: 

                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:12,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("TODO $index"),
                      );
                    })

          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: dashboardAppBar,
      body: SingleChildScrollView(
        // Add a SingleChildScrollView to the body
        child: Column(
          children: [
            Center(
              child: upcomingCard,
            ),
            Center(
              child: subjectsCard,
            )
          ],
        ),
      ),
    );
  }
}
