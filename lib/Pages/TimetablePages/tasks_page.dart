import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget{
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context){


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: tasksAppBar,
    );
  }
}


AppBar tasksAppBar = AppBar(
  title: Text('Tareas y Exámenes'),
  backgroundColor: Colors.blue[100],
  elevation: 10,

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);