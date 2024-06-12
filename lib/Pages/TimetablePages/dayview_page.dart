import 'package:flutter/material.dart';


class DayViewPage extends StatefulWidget{
  const DayViewPage({super.key});

  @override
  State<DayViewPage> createState() => _DayViewPageState();
}

class _DayViewPageState extends State<DayViewPage> {
  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: dayViewAppBar,

      //body: Placeholder(),
    );
  }
}


AppBar dayViewAppBar = AppBar(
  title: Text('Vista Diaria'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);

