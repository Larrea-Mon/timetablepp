// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';

class SettingsTimesPage extends StatefulWidget {
  const SettingsTimesPage({super.key});

  @override
  State<SettingsTimesPage> createState() => _SettingsTimesPageState();
}

class _SettingsTimesPageState extends State<SettingsTimesPage> {
  late int lessonsPerDay;
  late int lessonsLen;
  late int lessonsBreak;

  @override
  void initState() {
    lessonsPerDay = SettingsController().getLessonsPerDay();
    lessonsLen = SettingsController().getLessonsLength();
    lessonsBreak = SettingsController().getLessonsBreak();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar settingsTimesAppBar = AppBar(
      title: Text('Horario semanal'),
      actions: <Widget>[
        IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text(
                        'En estas opciones puedes editar la apariencia de la vista semanal.\n\nCambiar estas opciones facilita crear nuevas clases, pero también puedes poner las clases sin seguir el esquema.'),
                  );
                },
              );
            },
            icon: Icon(Icons.info)),
      ],
    );
    var myFirstController = TextEditingController(
        text: SettingsController().getLessonsPerDay().toString());
    ListTile tile0 = ListTile(
      title: Text('Lecciones por día'),
      subtitle: Text('$lessonsPerDay lecciones al día'),
      enabled: true,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog.adaptive(
              content: SizedBox(
                height: 80,
                width: BorderSide.strokeAlignCenter,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: myFirstController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                    hintStyle: TextStyle(color: Colors.grey[150]),
                    hintText: ('Lecciones al Día.'),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if ((myFirstController.text == '') ||
                        (myFirstController.text.trim() == '0')) {
                      Fluttertoast.showToast(
                          msg: 'Debe de haber un número mayor que 1.',
                          backgroundColor: Colors.grey);
                    } else {
                      SettingsController().setLessonsPerDay(
                          num.parse(myFirstController.text).toInt());
                      setState(() {
                        lessonsPerDay =
                            num.parse(myFirstController.text).toInt();
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Ok'),
                )
              ],
            );
          },
        );
      },
    );
    var mySecondController = TextEditingController(
        text: SettingsController().getLessonsLength().toString());
    ListTile tile1 = ListTile(
      title: Text('Duración por defecto de las lecciones'),
      subtitle: Text('$lessonsLen minutos(s)'),
      enabled: true,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog.adaptive(
              content: SizedBox(
                height: 80,
                width: BorderSide.strokeAlignCenter,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: mySecondController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                    hintStyle: TextStyle(color: Colors.grey[150]),
                    hintText: ('Duración de las lecciones.'),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if ((myFirstController.text == '') ||
                        (myFirstController.text.trim() == '0')) {
                      Fluttertoast.showToast(
                          msg: 'Debe de haber un número mayor que 1.',
                          backgroundColor: Colors.grey);
                    } else {
                      SettingsController().setLessonsPerDay(
                          num.parse(myFirstController.text).toInt());
                      setState(() {
                        lessonsPerDay =
                            num.parse(myFirstController.text).toInt();
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Ok'),
                )
              ],
            );
          },
        );
      },
    );
    ListTile tile2 = ListTile(
      title: Text('Tiempo por defecto entre clases'),
      subtitle: Text('TODO minuto(s)'),
      enabled: true,
      onTap: () {
        todoButton();
      },
    );

    ListTile tileTitle = ListTile(
      title: Text(
        'Horas de inicio de las lecciones',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );

    Column mainColumn = Column(
      children: [
        tile0,
        //const Divider(),
        tile1,
        //const Divider(),
        tile2,
        //const Divider(),
        tileTitle,
      ],
    );

    //TODO MainColumn.children.add(),
    return Scaffold(
      appBar: settingsTimesAppBar,
      body: SingleChildScrollView(
        child: mainColumn,
      ),
    );
  }
}
