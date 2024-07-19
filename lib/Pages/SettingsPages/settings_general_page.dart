// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/Themes/app_theme_controller.dart';


class SettingsGeneralPage extends StatefulWidget {
  const SettingsGeneralPage({super.key});

  @override
  State<SettingsGeneralPage> createState() => _SettingsGeneralPageState();
}

class _SettingsGeneralPageState extends State<SettingsGeneralPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                todoButton();
              },
            ),
            ListTile(
              title: Text('Dias Funcionales'),
              subtitle: Text('TODO Lun,Mar,Mie,Jue,Vie,Sab,Dom'),
              enabled: true,
              onTap: () {
                todoButton();
              },
            ),
            ListTile(
              title: Text('Primer día de la semana'),
              subtitle: Text('TODO Mon'),
              enabled: true,
              onTap: () {
                todoButton();
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
        //ThemeController().themeProvider.setSelectedThemeMode(ThemeMode.light);
        //AppThemeController().setAppTheme('light');
        ThemeProvider.controllerOf(context).setTheme('light');
        break;
      case 'oscuro':
        //ThemeController().themeProvider.setSelectedThemeMode(ThemeMode.light);
       // AppThemeController().setAppTheme('dark');
        ThemeProvider.controllerOf(context).setTheme('dark');
        break;
      default:
        todoButton();
        break;
    }
  }
}

AppBar settingsGeneralAppBar = AppBar(
  title: Text('General'),
  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
