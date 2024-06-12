// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsAutoMutePage extends StatefulWidget{
  const SettingsAutoMutePage({super.key});

  @override
  State<SettingsAutoMutePage> createState() => _SettingsPageState();
}
//TODO IMPORTANTE HACER LO DE LOS PERMISOS
class _SettingsPageState extends State<SettingsAutoMutePage> {
  @override
  Widget build(BuildContext context){


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: settingsAutoMuteAppBar,
      body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Autosilencio'),
              subtitle: Text('Silenciar automáticamente el dispositivo (excepto alarmas) durante las lecciones'),
              enabled: true,
              onTap: () {
                Fluttertoast.showToast(
                  msg: '//TODO implementar esto',
                  backgroundColor: Colors.grey,
                );
              },
            ),
            ListTile(
              title: Text('TODO PERMISOS'),
            ),
            ListTile(
              title: Text('Tiempo del silencio automático'),
              subtitle: Text('TODO minutos antes de que inicie la lección'),
              enabled: true,
              onTap: () {
                Fluttertoast.showToast(
                  msg: '//TODO implementar esto',
                  backgroundColor: Colors.grey,
                );
              },
            ),
            ListTile(
              title: Text('Modo silencio automático'),
              subtitle: Text('TODO silenciar'),
              enabled: true,
              onTap: () {
                Fluttertoast.showToast(
                  msg: '//TODO implementar esto',
                  backgroundColor: Colors.grey,
                );
              },
            ),
          ],
        )
    );
  }
}


AppBar settingsAutoMuteAppBar = AppBar(
  title: Text('Autosilencio'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);