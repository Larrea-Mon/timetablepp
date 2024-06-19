// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              title: Text('Tema de la aplicación'),
              subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                MainController().debugHolidays();

                List<HolidayPeriod> holidays = MainController().getHolidays();
                for (var i = 0; i < holidays.length; i++) {
                  debugPrint('$i');
                  debugPrint(holidays[i].toString());
                }

                Fluttertoast.showToast(
                  msg: 'Reiciadas las Holidays',
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
