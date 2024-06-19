// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget{
  const DashboardPage({super.key});

  
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}



class _DashboardPageState extends State<DashboardPage>{
  @override
  Widget build(BuildContext context){


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: dashboardAppBar,

      //body: Placeholder(),
    );
  }
}


AppBar dashboardAppBar = AppBar(
  title: Text('Página Principal'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);