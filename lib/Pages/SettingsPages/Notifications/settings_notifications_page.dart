// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';

import 'column_homework.dart';
import 'column_lesson.dart';
class SettingsNotificationsPage extends StatefulWidget {
  const SettingsNotificationsPage({super.key});

  @override
  State<SettingsNotificationsPage> createState() =>
      _SettingsNotificationsPageState();
}

class _SettingsNotificationsPageState extends State<SettingsNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSettingsNotificationsAppBar(),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          LessonNotifsTilesPackage(),
          HomeworkNotifsTilesPackage(),
          ListTile(
            title: Text('TODO Notificacion de Examen'),
            subtitle: Text('TODO dia(s) antes de la fecha de entrega'),
            enabled: true,
            onTap: () {
              todoButton();
            },
          ),
          ListTile(
            title: Text('Notificacion de tiempo'),
            subtitle: Text('TODO dia(s) antes de la fecha de entrega'),
            enabled: true,
            onTap: () {
              todoButton();
            },
          ),
        ]).toList(),
      ),
    );
  }

  _buildSettingsNotificationsAppBar() {
    return AppBar(
      title: Text('Notificaciones'),
    );
  }
}



