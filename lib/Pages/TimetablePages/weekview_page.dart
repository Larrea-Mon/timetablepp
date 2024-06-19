// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WeekViewPage extends StatefulWidget{
  const WeekViewPage({super.key});

  @override
  State<WeekViewPage> createState() => _WeekViewPageState();
}

class _WeekViewPageState extends State<WeekViewPage> {
  @override
  Widget build(BuildContext context){


     return Scaffold(
      backgroundColor: Colors.white,
      appBar: weekViewAppBar,
    );
  }
}


AppBar weekViewAppBar = AppBar(
  title: Text('Vista Semanal'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);