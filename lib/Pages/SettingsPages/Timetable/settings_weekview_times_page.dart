// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Control/weekview_backend.dart';

class SettingsTimesPage extends StatefulWidget {
  const SettingsTimesPage({super.key});

  @override
  State<SettingsTimesPage> createState() => _SettingsTimesPageState();
} //TODO ENORME: Implementar alguna medida de seguridad para que no se vaya de las manos esto.
// AQUI ha ocurrido un desastre y la mitad de esta funcionalidad no va a ver la luz.

class _SettingsTimesPageState extends State<SettingsTimesPage> {
  late int lessonsPerDay;
  late int lessonsLen;
  late int lessonsBreak;
  late ListView listaInicios;

  @override
  void initState() {
    lessonsPerDay = WeekviewBackend().getLessonsPerDay();
    //lessonsLen = WeekviewBackend().getLessonsLength();
    //lessonsBreak = WeekviewBackend().getLessonsBreak();
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
        text: WeekviewBackend().getLessonsPerDay().toString());
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
                    if (myFirstController.text == '') {
                      Fluttertoast.showToast(
                          msg: 'Debe de haber un número mayor que 1.',
                          backgroundColor: Colors.grey);
                    } else if ((myFirstController.text.trim() == '0')) {
                      Fluttertoast.showToast(
                          msg: 'Debe de haber un número mayor que 1.',
                          backgroundColor: Colors.grey);
                    } else if ((num.parse(myFirstController.text.trim()) >
                        17)) {
                      Fluttertoast.showToast(
                          msg:
                              '16 es el máximo de divisiones que puedes tener en un día.',
                          backgroundColor: Colors.grey);
                    } else {
                      WeekviewBackend().setLessonsPerDay(
                        num.parse(myFirstController.text).toInt(),
                      );
                      setState(
                        () {
                          lessonsPerDay =
                              num.parse(myFirstController.text).toInt();
                        },
                      );
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
    /* ESTO TAMBIEN ESTÁ CONGELADO HASTA PROXIMO AVISO
    var mySecondController = TextEditingController(
        text: WeekviewBackend().getLessonsLength().toString());
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
                      WeekviewBackend().setLessonsLength(
                          num.parse(mySecondController.text).toInt());
                      setState(() {
                        lessonsLen = num.parse(mySecondController.text).toInt();
                      });
                      Future.delayed(
                        Durations.medium1,
                      );
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
    );*/

    /*  ESTO SE IMPLEMENTARÁ EN OTRO MOMENTO. 
    var myThirdController =
        TextEditingController(text: lessonsBreak.toString());
    ListTile tile2 = ListTile(
      title: Text('Tiempo por defecto entre clases'),
      subtitle: Text('$lessonsBreak minuto(s)'),
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
                  controller: myThirdController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                    hintStyle: TextStyle(color: Colors.grey[150]),
                    hintText: ('Descanso entre clases.'),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if ((myFirstController.text == '')) {
                      Fluttertoast.showToast(
                          msg: 'Debe de haber un número igual o mayor que 0.',
                          backgroundColor: Colors.grey);
                    } else {
                      WeekviewBackend().setLessonsBreak(
                          num.parse(myThirdController.text).toInt());
                      setState(() {
                        lessonsBreak =
                            num.parse(myThirdController.text).toInt();
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
    ); */
    ListView listaInicios = ListView.builder(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: lessonsPerDay,
      itemBuilder: (context, index) {
        var data = WeekviewBackend().getWeekviewLesson(index);
        return ListTile(
          title: Text('Clase ${index + 1}'),
          subtitle: Text('${toDtoString(data.getTimeOfDay())}'),
          onTap: () async {
            TimeOfDay? pickedTime = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return TimePickerDialog(
                  initialTime: data.getTimeOfDay(),
                );
              },
            );
            if (pickedTime != null) {
              
              data.startHour = pickedTime.hour;
              data.startMinute = pickedTime.minute;
              WeekviewBackend().sortLessons();
              WeekviewBackend().pushLessons();
              setState(() {});
            } //Fluttertoast.showToast(msg: "Picked ${toDtoString(pickedTime!)}");
          },
        );
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
      mainAxisSize: MainAxisSize.min,
      children: [
        tile0,
        //const Divider(),
        //tile1,
        //const Divider(),
        //tile2,
        //const Divider(),
        tileTitle,
        Flexible(
          child: listaInicios,
        ),
      ],
    );

    return Scaffold(
      appBar: settingsTimesAppBar,
      body: mainColumn,
    );
  }
}
