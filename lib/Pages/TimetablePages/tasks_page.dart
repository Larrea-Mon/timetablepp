// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: tasksAppBar,
    );
  }
}

AppBar tasksAppBar = AppBar(
  title: Text('Tareas y Exámenes'),
  backgroundColor: Colors.blue[100],
  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
