// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';
import 'package:timetablepp/Control/weekview_backend.dart';
import 'package:timetablepp/Pages/SettingsPages/Timetable/settings_weekview_times_page.dart';

class AddLessonPage extends StatefulWidget {
  const AddLessonPage({super.key});

  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}

class _AddLessonPageState extends State<AddLessonPage> {
  //MATERIALES NECESARIOS PARA EL ASUNTO
  final TextEditingController subjectController = TextEditingController();
  final Color pickedcolor = Colors.black;
  int pickedDayOfTheWeek = 1;
  @override
  void initState() {
    super.initState();
  }

  late AppBar myAppBar = AppBar(
    title: Text('Nueva Clase'),
    actions: [
      IconButton(
        onPressed: () => todoButton(),
        icon: Icon(Icons.info),
      ),
      IconButton(
        onPressed: () => debugPrint(subjectController.text),
        icon: Icon(Icons.save),
      ),
    ],
  );

  DropdownMenu _buildSubjectPickerDropDown() {
    var list = WeekviewBackend().getAllSubjects();

    List<DropdownMenuEntry> entriesList = List.empty(growable: true);
    for (var element in list) {
      entriesList.add(
        DropdownMenuEntry(
          label: element.name!,
          value: element.id,
          leadingIcon: Icon(
            Icons.circle,
            color: MainController().getColorFromName(element.color),
          ),
        ),
      );
    }

    DropdownMenu result = DropdownMenu(
      dropdownMenuEntries: entriesList,
      controller: subjectController,
      label: Text('Asignatura'),
      onSelected: (value) {/*TODO hacer que esto cambie de color*/},
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

  Column _buildPickDayOfTheWeekTile() {
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
      child: mySlider,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
    );

    ListTile myTitleTile =ListTile(
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
  //ListTile _buildPickStartHour() {}

  //ListTile _buildPickEndHour() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Column(
        children: [
          _buildPickSubjectListTile(),
          _buildPickDayOfTheWeekTile(),
          //_buildPickStartHour(),
          //_buildPickEndHour(),
        ],
      ),
    );
  }
}
