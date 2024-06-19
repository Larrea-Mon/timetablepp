// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsNotificationsPage extends StatefulWidget {
  const SettingsNotificationsPage({super.key});

  @override
  State<SettingsNotificationsPage> createState() => _SettingsNotificationsPageState();
}

class _SettingsNotificationsPageState extends State<SettingsNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: settingsNotificationsAppBar,
body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            title: Text('Notificaciónes de Lección'),
            subtitle: Text('Muestra la siguiente lección'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
          ListTile(
            title: Text('Notificacion de tiempo'),
            subtitle: Text('TODO minuto(s) antes de que empieze la lección'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
          ListTile(
            title: Text('Notificación de Tarea'),
            subtitle: Text('Muestra las próximas tareas'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
          ListTile(
            title: Text('Notificacion de tiempo'),
            subtitle: Text('TODO dia(s) antes de la fecha de entrega'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
          ListTile(
            title: Text('Notificacion de Examen'),
            subtitle: Text('TODO dia(s) antes de la fecha de entrega'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
          ListTile(
            title: Text('Notificacion de tiempo'),
            subtitle: Text('TODO dia(s) antes de la fecha de entrega'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
        ]).toList(),
      ),
    );
  }
}

AppBar settingsNotificationsAppBar = AppBar(
  title: Text('Notificaciones'),
  backgroundColor: Colors.blue[100],
  //TODO poner un botón aqui?

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
