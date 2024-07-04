// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/subject.dart';

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
                debugAddHolidays();
                List<HolidayPeriod> holidays = MainController().getHolidays();
                for (var i = 0; i < holidays.length; i++) {
                  debugPrint('$i');
                  debugPrint(holidays[i].toString());
                }

                Fluttertoast.showToast(
                  msg: 'Añadidas',
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
            ListTile(
              title: Text('Añade Asignaturas'),
              //subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                debugAddSubjects();

                Fluttertoast.showToast(
                  msg: 'Añadidas Asignaturas',
                  backgroundColor: Colors.grey,
                );
              },
            ),
            ListTile(
              title: Text('Borra todas las Asignaturas'),
              //subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                int i = MainController().deleteAllSubjects();

                Fluttertoast.showToast(
                  msg: 'Eliminadas $i asignaturas',
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

void debugAddHolidays() {
  MainController().addHoliday(HolidayPeriod(DateTime.utc(2024, 12, 18),
      DateTime.utc(2025, 01, 20), 'Vacaciones de Navidad'));
  MainController().addHoliday(HolidayPeriod(
      DateTime.utc(2024, 01, 06), DateTime.utc(2024, 01, 07), 'Reyes Magos'));
  MainController().addHoliday(HolidayPeriod(
      DateTime.utc(2024, 01, 01), DateTime.utc(2024, 01, 01), 'Año Nuevo'));
  MainController().addHoliday(HolidayPeriod(
      DateTime.utc(2024, 02, 14), DateTime.utc(2024, 02, 14), 'San Valentin'));
  MainController().addHoliday(HolidayPeriod(
      DateTime.utc(2024, 03, 23), DateTime.utc(2024, 03, 23), 'Viernes Santo'));
  MainController().addHoliday(HolidayPeriod(DateTime.utc(2024, 05, 01),
      DateTime.utc(2024, 05, 01), 'Dia del trabajador'));
  MainController().addHoliday(HolidayPeriod(DateTime.utc(2024, 10, 12),
      DateTime.utc(2024, 10, 12), 'Fiesta Nacional de españa'));
  MainController().addHoliday(HolidayPeriod(DateTime.utc(2024, 11, 14),
      DateTime.utc(2024, 11, 15), 'Dia de la Constitución'));
}

void debugAddSubjects() {
  Subject a = Subject('Calculo I', 'CAL', 'Profe 1', "E301", 'blue');
  debugPrint(a.toString());

  MainController().addSubject(a);
  MainController().addSubject(Subject(
      'Estadistica ', 'STA', 'Profe 1', "E301", SubjectColors.grass.name));
  MainController().addSubject(Subject(
      'Programacion I', 'PRO', 'Profe 1', "E301", SubjectColors.forest.name));
}
