// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/app_theme_controller.dart';

class SettingsGeneralPage extends StatefulWidget {
  const SettingsGeneralPage({super.key});

  @override
  State<SettingsGeneralPage> createState() => _SettingsGeneralPageState();
}

class _SettingsGeneralPageState extends State<SettingsGeneralPage> {
  _buildSettingsGeneralAppBar() {
    return AppBar(
      title: Text('General'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSettingsGeneralAppBar(),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Tema de la aplicación'),
            subtitle: Text('El tema actual es: ${AppThemeController().getActiveThemeName().capitalize}'),
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
      ),
    );
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
                Navigator.pop(context, 'summer');
              },
              child: Text('Tema Claro - verano'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'spring');
              },
              child: Text('Tema Claro - primavera'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'autumn');
              },
              child: Text('Tema Oscuro - otoño'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'winter');
              },
              child: Text('Tema Oscuro - invierno'),
            ),
          ],
        );
      },
    )) {
      case 'autumn':
        AppThemeController().setAppTheme('autumn');
        ThemeProvider.controllerOf(context).setTheme('autumn');
        break;
      case 'winter':
        AppThemeController().setAppTheme('winter');
        ThemeProvider.controllerOf(context).setTheme('winter');
        break;
      case 'spring':
        AppThemeController().setAppTheme('spring');
        ThemeProvider.controllerOf(context).setTheme('spring');
        break;
      case 'summer':
        AppThemeController().setAppTheme('summer');
        ThemeProvider.controllerOf(context).setTheme('summer');
        break;
      default:
        todoButton();
        break;
    }
  }
}
