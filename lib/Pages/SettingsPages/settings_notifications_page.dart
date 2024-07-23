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
          ListTile(
            title: Text('Notificaciónes de Lección'),
            subtitle: Text('Muestra la siguiente lección'),
            enabled: true,
            onTap: () {
              todoButton();
            },
          ),
          ListTile(
            title: Text('Notificacion de tiempo'),
            subtitle: Text('TODO minuto(s) antes de que empieze la lección'),
            enabled: true,
            onTap: () {
              todoButton();
            },
          ),
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
    //TODO poner un botón aquí?
  }
}


class _ClassNotifsTilesPackage extends StatefulWidget{
  const _ClassNotifsTilesPackage();
  @override
  State<_ClassNotifsTilesPackage> createState() => _ClassNotifsTilesPackageState();
}
class _ClassNotifsTilesPackageState extends State<_ClassNotifsTilesPackage>{
  bool asdas = true;
  
  
  @override
  void initState() {
    asdas = SettingsController().
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(value: value, onChanged: onChanged)
      ],
    );
  }
}