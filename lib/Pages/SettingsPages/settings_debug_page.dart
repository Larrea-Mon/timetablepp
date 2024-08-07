// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';
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
        appBar: settingsDebugAppBar,
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Añade Vacaciones'),
              //subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                debugAddHolidays();
                List<HolidayPeriod> holidays =
                    DatabaseController().getAllHolidayPeriods();
                for (var i = 0; i < holidays.length; i++) {
                  debugPrint('$i');
                  debugPrint(holidays[i].toString());
                }

                Fluttertoast.showToast(
                  msg: 'Añadidas',
                );
              },
            ),
            ListTile(
              title: Text('Borra todas las vacaciones'),
              //subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                int i = DatabaseController().deleteHolidays();

                Fluttertoast.showToast(
                  msg: 'Eliminadas $i vacaciones',
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
                );
              },
            ),
            ListTile(
              title: Text('Borra todas las Asignaturas'),
              //subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () {
                int i = DatabaseController().deleteAllSubjects();

                Fluttertoast.showToast(
                  msg: 'Eliminadas $i asignaturas',
                );
              },
            ),
            ListTile(
              title: Text('Ver todas las opciones'),
              enabled: true,
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('settingsbatch'),
                      content: Text(
                          SettingsController().getAllSettings().toString()),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ok'))
                      ],
                    );
                  },
                );
              },
            ), 
            ListTile(
              title: Text('Ver todas las Lessons'),
              enabled: true,
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('lessons'),
                      content: Text(
                          DatabaseController().getAllLessons().toString()),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ok'))
                      ],
                    );
                  },
                );
              },
            ), 
          ],
        ));
  }
}

AppBar settingsDebugAppBar = AppBar(
  title: Text('Debug'),

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);

void debugAddHolidays() {
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 12, 18),
      end: DateTime.utc(2025, 01, 20),
      name: 'Vacaciones de Navidad'));
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 01, 06),
      end: DateTime.utc(2024, 01, 07),
      name: 'Reyes Magos'));
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 01, 01),
      end: DateTime.utc(2024, 01, 01),
      name: 'Año Nuevo'));
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 02, 14),
      end: DateTime.utc(2024, 02, 14),
      name: 'San Valentin'));
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 03, 23),
      end: DateTime.utc(2024, 03, 23),
      name: 'Viernes Santo'));
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 05, 01),
      end: DateTime.utc(2024, 05, 01),
      name: 'Dia del trabajador'));
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 10, 12),
      end: DateTime.utc(2024, 10, 12),
      name: 'Fiesta Nacional de españa'));
  DatabaseController().putHolidayPeriod(HolidayPeriod(
      start: DateTime.utc(2024, 11, 14),
      end: DateTime.utc(2024, 11, 15),
      name: 'Dia de la Constitución'));
}

void debugAddSubjects() {
  Subject a = Subject(
      name: 'Calculo I',
      abv: 'CAL',
      teacher: 'Profe 1',
      place: "E301",
      color: SubjectColors.river.name);
  debugPrint(a.toString());

  DatabaseController().putSubject(a);
  DatabaseController().putSubject(Subject(
      name: 'Estadistica ',
      abv: 'STA',
      teacher: 'Profe 2',
      place: "E302",
      color: SubjectColors.grass.name));
  DatabaseController().putSubject(Subject(
      name: 'Programacion I',
      abv: 'PRO',
      teacher: 'Profe 3',
      place: "E126",
      color: SubjectColors.forest.name));
}
