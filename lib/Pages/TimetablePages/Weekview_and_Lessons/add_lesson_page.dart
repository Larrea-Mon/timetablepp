// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Control/weekview_backend.dart';
import 'package:timetablepp/Models/lesson.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/Pages/SettingsPages/Timetable/settings_weekview_times_page.dart';

class AddLessonPage extends StatefulWidget {
  const AddLessonPage({super.key});

  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}

class _AddLessonPageState extends State<AddLessonPage> {
  @override
  void initState() {
    super.initState();
  }

  //MATERIALES NECESARIOS PARA EL ASUNTO
  TextEditingController subjectController = TextEditingController();
  Color pickedcolor = Colors.black;
  int pickedDayOfTheWeek = 1;
  TimeOfDay pickedStartTime = TimeOfDay(hour: 10, minute: 0);
  TimeOfDay pickedEndTime = TimeOfDay(hour: 11, minute: 0);
  late Subject pickedSubject;

  late AppBar myAppBar = AppBar(
    title: Text('Nueva Clase'),
    actions: [
      IconButton(
        onPressed: () => todoButton(),
        icon: Icon(Icons.info),
      ),
      IconButton(
        onPressed: () {
          debugPrint('[ADDLESSONPAGE]: ${subjectController.text}');
          if (subjectController.text.trim() != '') {
            if ((pickedStartTime.hour > pickedEndTime.hour) ||
                ((pickedStartTime.hour == pickedEndTime.hour) &&
                    (pickedStartTime.minute > pickedEndTime.minute))) {
              Fluttertoast.showToast(
                  msg: 'La hora inicio debe ser anterior a la hora final.',
                  backgroundColor: Colors.grey);
            } else {
              Lesson myLesson = Lesson.asToD(
                  day: pickedDayOfTheWeek,
                  startTod: pickedStartTime,
                  endTod: pickedEndTime);
              myLesson.subject.target = pickedSubject;
              DatabaseController().putLesson(myLesson);
              Navigator.of(context).pop();
              
            }
          } else {
            Fluttertoast.showToast(
                msg: 'Debes Elegir una asignatura',
                backgroundColor: Colors.grey);
          }
        },
        icon: Icon(Icons.save),
      ),
    ],
  );

  DropdownMenu _buildSubjectPickerDropDown() {
    var list = WeekviewBackend().getAllSubjects();

    List<DropdownMenuEntry> entriesList = List.empty(growable: true);
    for (var subject in list) {
      entriesList.add(
        DropdownMenuEntry(
          label: subject.name!,
          value: subject.id,
          leadingIcon: Icon(
            Icons.circle,
            color: MainController().getColorFromName(subject.color),
          ),
        ),
      );
    }

    DropdownMenu result = DropdownMenu(
      dropdownMenuEntries: entriesList,
      controller: subjectController,
      label: Text('Asignatura'),
      onSelected: (value) {
        pickedSubject = list.firstWhere((element) => element.id == value);
      },
    );
    return result;
  }

  ListTile _buildPickSubjectListTile() {
    ListTile result = ListTile(
      contentPadding: EdgeInsets.fromLTRB(50, 20, 50, 0),
      //title: Text('Asignatura:'),
      leading: Icon(
        Icons.book,
        size: 40,
        color: pickedcolor,
      ),
      trailing: _buildSubjectPickerDropDown(),
    );
    return result;
  }

  Column _buildPickDayOfTheWeekColumn() {
    Slider mySlider = Slider(
      value: pickedDayOfTheWeek.toDouble(),
      min: 1.0,
      divisions: 6,
      max: 7.0,
      label: intToDay(pickedDayOfTheWeek),
      onChanged: (double value) {
        setState(
          () {
            pickedDayOfTheWeek = value.toInt();
            //SettingsController().setFirstDayOfTheWeek(value.toInt());
          },
        );
      },
    );
    Padding mySliderRow = Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: mySlider,
    );

    ListTile myTitleTile = ListTile(
      title: Text(
        'Día de la clase',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );

    return Column(
      children: [myTitleTile, mySliderRow],
    );
  }
  /*ListTile _buildPickStartHour(){
    return ListTile(title: Text(pickedStartTime.toString()),);
  }*/

  Column _buildPickHourColumn() {
    ListTile myTitleTile = ListTile(
      title: Text(
        'Horas de la clase',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );

    Row myRow = Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: OutlinedButton.icon(
            onPressed: () async {
              TimeOfDay? pickedTime = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TimePickerDialog(
                    initialTime: pickedStartTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                },
              );
              if (pickedTime != null) {
                setState(() {
                  pickedStartTime = pickedTime;
                });
              }
            },
            icon: Icon(Icons.access_time),
            label: Text('Inicio: ${toDtoString(pickedStartTime)}'),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: OutlinedButton.icon(
            onPressed: () async {
              TimeOfDay? pickedTime = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TimePickerDialog(
                    initialTime: pickedEndTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                },
              );
              if (pickedTime != null) {
                setState(() {
                  pickedEndTime = pickedTime;
                });
              }
            }, //TODO implementar esto MAÑANA
            icon: Icon(Icons.timelapse),
            label: Text('Final: ${toDtoString(pickedEndTime)}'),
          ),
        )
      ],
    );

    return Column(
      children: [
        myTitleTile,
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: myRow,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Column(
        children: [
          _buildPickSubjectListTile(),
          _buildPickDayOfTheWeekColumn(),
          _buildPickHourColumn(),
        ],
      ),
    );
  }
}
