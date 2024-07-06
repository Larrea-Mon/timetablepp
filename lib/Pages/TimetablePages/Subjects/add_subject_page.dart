// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Models/holidayperiod.dart';
import 'package:timetablepp/Models/subject.dart';
import 'package:timetablepp/Pages/TimetablePages/Holidays/addholiday_page.dart';

import '../Holidays/addholiday_appbar.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({super.key});
  @override
  State<AddSubjectPage> createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  var subject = MainController().getCurrentSubject();
  buildSubjectAppBar() {
    return AppBar(
      backgroundColor: colorToColor(subject.color),
      title: Text(subject.name),
      actions: [IconButton(onPressed: todoButton, icon: Icon(Icons.info))],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSubjectAppBar(),
      body: Column(
        children: [
          Container(
            child: TextField(
              spellCheckConfiguration: null,
            ),
          ),
        ],
      ),
    );
  }
}
