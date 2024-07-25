// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';

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
          _LessonNotifsTilesPackage(),
          ListTile(
            title: Text('Notificación de Tarea'),
            subtitle: Text('Muestra las próximas tareas'),
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
          ListTile(
            title: Text('Notificacion de Examen'),
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

class _LessonNotifsTilesPackage extends StatefulWidget {
  const _LessonNotifsTilesPackage();
  @override
  State<_LessonNotifsTilesPackage> createState() =>
      _LessonNotifsTilesPackageState();
}

class _LessonNotifsTilesPackageState extends State<_LessonNotifsTilesPackage> {
  late bool asdas;

  @override
  void initState() {
    asdas = SettingsController().getSendNotifsNextLesson();
    super.initState();
  }

  late ListTile myTile;
  late CheckboxListTile myCheckBoxListTile;

  @override
  Widget build(BuildContext context) {
    myTile = ListTile(
      enabled: SettingsController().getSendNotifsNextLesson(),
      title: Text('Mandar la notificación con antelación.'),
      subtitle: Text('${SettingsController().getTimeSendNotifsNextLesson()} minutos antes de clase'),
    );
    myCheckBoxListTile = CheckboxListTile(
      title: Text('Notificación antes de clase'),
      value: asdas,
      onChanged: (bool? value) => {
        SettingsController().setSendNotifsNextLesson(value!),
        setState(() {
          asdas = value;
        }),
      },
    );

    return Column(
      children: [
        myCheckBoxListTile,
        myTile,
      ],
    );
  }
}
