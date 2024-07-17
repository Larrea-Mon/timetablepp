// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/theme_controller.dart';

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
              subtitle: Text('El tema actual es '),
              enabled: true,
              onTap: () => {settingsChangeThemeApp()},
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

  settingsChangeThemeApp() async {
    switch (await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Selecciona un Tema para la aplicación'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'claro');
              },
              child: Text('Tema Claro'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'oscuro');
              },
              child: Text('Tema Oscuro'),
            ),
          ],
        );
      },
    )) {
      case 'claro':
        ThemeController().setAppTheme('light');
        break;
      case 'oscuro':
        ThemeController().setAppTheme('dark');
        break;
      default:
        todoButton();
        break;
    }
  }
}

AppBar settingsGeneralAppBar = AppBar(
  title: Text('General'),
  backgroundColor: Colors.blue[100],

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
