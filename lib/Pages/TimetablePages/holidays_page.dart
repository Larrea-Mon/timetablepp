import 'package:flutter/material.dart';

class HolidaysPage extends StatefulWidget{
  @override
  State<HolidaysPage> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  @override
  Widget build(BuildContext context){


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: holidaysViewAppBar,

      //body: Placeholder(),
    );
  }
}

AppBar holidaysViewAppBar = AppBar(
  title: Text('Vacaciones'),
  backgroundColor: Colors.blue[100],
  elevation:20,

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);