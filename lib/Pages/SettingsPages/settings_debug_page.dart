// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';

class SettingsDebugPage extends StatefulWidget {
  const SettingsDebugPage({super.key});

  @override
  State<SettingsDebugPage> createState() => _SettingsDebugPageState();
}

class _SettingsDebugPageState extends State<SettingsDebugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: settingsGeneralAppBar,
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Añade Vacaciones'),
              //subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                MainController().debugHolidays();

                List<HolidayPeriod> holidays = MainController().getHolidays();
                for (var i = 0; i < holidays.length; i++) {
                  debugPrint('$i');
                  debugPrint(holidays[i].toString());
                }

                Fluttertoast.showToast(
                  msg: 'Añadidas ',
                  backgroundColor: Colors.grey,
                );
              },
            ),
            ListTile(
              title: Text('Borra todas las vacaciones'),
              //subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                int i = MainController().deleteHolidays();

                Fluttertoast.showToast(
                  msg: 'Eliminadas $i vacaciones',
                  backgroundColor: Colors.grey,
                );
              },
            ),
          ],
        ));
  }
}

AppBar settingsGeneralAppBar = AppBar(
  title: Text('General'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);

AppBar settingsDebugAppBar = AppBar(
  title: Text('Debug'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
