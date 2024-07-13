// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsGeneralPage extends StatefulWidget {
  const SettingsGeneralPage({super.key});

  @override
  State<SettingsGeneralPage> createState() => _SettingsGeneralPageState();
}

class _SettingsGeneralPageState extends State<SettingsGeneralPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: settingsGeneralAppBar,
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Tema de la aplicación'),
              subtitle: Text('TODO Light'),
              enabled: true,
              onTap: () => {
              },
            ),
            ListTile(
              title: Text('Tema del Widget'),
              subtitle: Text('TODO Dark'),
              enabled: true,
              onTap: () {
                Fluttertoast.showToast(
                  msg: '//TODO implementar esto',
                  backgroundColor: Colors.grey,
                );
              },
            ),
            ListTile(
              title: Text('Dias Funcionales'),
              subtitle: Text('TODO Lun,Mar,Mie,Jue,Vie,Sab,Dom'),
              enabled: true,
              onTap: () {
                Fluttertoast.showToast(
                  msg: '//TODO implementar esto',
                  backgroundColor: Colors.grey,
                );
              },
            ),
            ListTile(
              title: Text('Primer día de la semana'),
              subtitle: Text('TODO Mon'),
              enabled: true,
              onTap: () {
                Fluttertoast.showToast(
                  msg: '//TODO implementar esto',
                  backgroundColor: Colors.grey,
                );
              },
            ),
          ],
        ));
  }
}

AppBar settingsGeneralAppBar = AppBar(
  title: Text('General'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
