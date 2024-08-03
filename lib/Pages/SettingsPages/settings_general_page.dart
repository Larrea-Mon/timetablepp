// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Control/app_theme_controller.dart';
import 'package:timetablepp/Control/settings_controller.dart';

import '../../Control/widget_controller.dart';

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
            subtitle: Text(
                'El tema actual es: ${AppThemeController().getActiveThemeName().capitalize}'),
            enabled: true,
            onTap: () => {settingsChangeThemeApp()},
          ),
          _WidgetThemeListTile(),
          _ActiveDaysRow(),
          _FirstDayOfTheWeekTile(),
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

class _WidgetThemeListTile extends StatefulWidget {
  const _WidgetThemeListTile();
  @override
  State<_WidgetThemeListTile> createState() => _WidgetThemeListTileState();
}

class _WidgetThemeListTileState extends State<_WidgetThemeListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Tema del Widget'),
      subtitle: Text(
          'El Tema Actual es: ${WidgetController().getWidgetTheme().capitalize}'),
      enabled: true,
      onTap: () async {
        switch (await showDialog<int>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text('Selecciona un Tema para el Widget'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 0);
                  },
                  child: Text('Tema Claro'),
                ),
                SimpleDialogOption(
                  child: Text('Tema Oscuro'),
                  onPressed: () {
                    Navigator.pop(context, 1);
                  },
                )
              ],
            );
          },
        )) {
          case 0:
            WidgetController().setWidgetTheme(0);
            setState(() {});
            break;
          case 1:
            WidgetController().setWidgetTheme(1);
            setState(() {});
            break;
          default:
            debugPrint('[settingsChangeWidgetTheme]: Algo ha salido mal.');
            break;
        }
      },
    );
  }
}

class _ActiveDaysListTile extends StatefulWidget {
  const _ActiveDaysListTile();
  @override
  State<_ActiveDaysListTile> createState() => _ActiveDaysListTileState();
}

class _ActiveDaysListTileState extends State<_ActiveDaysListTile> {
  @override
  void initState() {
    super.initState();
  }

  String _getActiveDays() {
    String result = '';
    SettingsController().getIsMondayActive()
        ? (result = '${result}Mon,')
        : result = result;
    SettingsController().getIsTuesdayActive()
        ? (result = '${result}Tues,')
        : result = result;
    SettingsController().getIsWednesdayActive()
        ? (result = '${result}Wed,')
        : result = result;
    SettingsController().getIsThursdayActive()
        ? (result = '${result}Thu,')
        : result = result;
    SettingsController().getIsFridayActive()
        ? (result = '${result}Fri,')
        : result = result;
    SettingsController().getIsSaturdayActive()
        ? (result = '${result}Sat,')
        : result = result;
    SettingsController().getIsSundayActive()
        ? (result = '${result}Sun,')
        : result = result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    //Un poquito de mentir a la máquina o al usuario.
    return ListTile(
      title: Text('Días Activos'),
      subtitle: Text(_getActiveDays()),
      onTap: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              children: <Widget>[
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return CheckboxListTile(
                      title: Text('Monday'),
                      value: SettingsController().getIsMondayActive(),
                      onChanged: (bool? value) {
                        SettingsController().setIsMondayActive(value!);
                        setState(() {});
                      },
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return CheckboxListTile(
                      title: Text('Tuesday'),
                      value: SettingsController().getIsTuesdayActive(),
                      onChanged: (bool? value) {
                        SettingsController().setIsTuesdayActive(value!);
                        setState(() {});
                      },
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return CheckboxListTile(
                      title: Text('Wednesday'),
                      value: SettingsController().getIsMondayActive(),
                      onChanged: (bool? value) {
                        SettingsController().setIsMondayActive(value!);
                        setState(() {});
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _ActiveDaysRow extends StatefulWidget {
  const _ActiveDaysRow();
  @override
  State<_ActiveDaysRow> createState() => _ActiveDaysRowState();
}

class _ActiveDaysRowState extends State<_ActiveDaysRow> {
  @override
  void initState() {
    super.initState();
  }

  _mondayCheckBox() {
    return Checkbox(
      value: SettingsController().getIsMondayActive(),
      onChanged: (bool? value) {
        SettingsController().setIsMondayActive(value!);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          children: [
            ListTile(
              title: Text('Días Activos'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text('Monday'),
                        _mondayCheckBox(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text('Tuesday'),
                        Checkbox(
                          value: SettingsController().getIsTuesdayActive(),
                          onChanged: (bool? value) {
                            SettingsController().setIsTuesdayActive(value!);
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text('Wednesday'),
                        Checkbox(
                          value: SettingsController().getIsWednesdayActive(),
                          onChanged: (bool? value) {
                            SettingsController().setIsWednesdayActive(value!);
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text('Thursday'),
                        Checkbox(
                          value: SettingsController().getIsThursdayActive(),
                          onChanged: (bool? value) {
                            SettingsController().setIsThursdayActive(value!);
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text('Friday'),
                        Checkbox(
                          value: SettingsController().getIsFridayActive(),
                          onChanged: (bool? value) {
                            SettingsController().setIsFridayActive(value!);
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text('Saturday'),
                        Checkbox(
                          value: SettingsController().getIsSaturdayActive(),
                          onChanged: (bool? value) {
                            SettingsController().setIsSaturdayActive(value!);
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text('Sunday'),
                        Checkbox(
                          value: SettingsController().getIsSundayActive(),
                          onChanged: (bool? value) {
                            SettingsController().setIsSundayActive(value!);
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class _FirstDayOfTheWeekTile extends StatefulWidget {
  const _FirstDayOfTheWeekTile();
  @override
  State<_FirstDayOfTheWeekTile> createState() => _FirstDayOfTheWeekTileState();
}

class _FirstDayOfTheWeekTileState extends State<_FirstDayOfTheWeekTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO que se vea esto siempre.
    return Column(
      children: [
        ListTile(
          title: Text('Primer día de la semana'),
          enabled: true,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Slider(
            value: SettingsController().getFirstDayOfTheWeek().toDouble(),
            min: 1.0,
            divisions: 6,
            max: 7.0,
            label: intToDay(SettingsController().getFirstDayOfTheWeek()),
            onChanged: (double value) {
              setState(
                () {
                  SettingsController().setFirstDayOfTheWeek(value.toInt());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

String intToDay(int dayOfTheWeek) {
  switch (dayOfTheWeek) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      debugPrint('IntToDay: Something went Wrong');
      return 'Monday';
  }
}
