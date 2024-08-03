// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timetablepp/Pages/SettingsPages/settings_automute_page.dart';
import 'package:timetablepp/Pages/SettingsPages/settings_debug_page.dart';
import 'package:timetablepp/Pages/SettingsPages/settings_appearance_page.dart';
import 'package:timetablepp/Pages/SettingsPages/NotificationSettings/settings_notifications_page.dart';
import 'package:timetablepp/Pages/SettingsPages/settings_privacy_page.dart';
import 'package:timetablepp/Pages/SettingsPages/Timetable/settings_weekview_times_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingsAppBar,
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('General'),
              enabled: true,
              onTap: () {
                debugPrint('General');

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsAppearancePage()));
              },
            ),
            ListTile(
              title: Text('Notificaciones'),
              enabled: true,
              onTap: () {
                debugPrint('Notifications');

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SettingsNotificationsPage()));
              },
            ),
            ListTile(
              title: Text('Autosilencio'),
              enabled: true,
              onTap: () {
                debugPrint('Automute');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsAutoMutePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Horario semanal'),
              enabled: true,
              onTap: () {
                debugPrint('Horario');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsTimesPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Privacidad'),
              enabled: true,
              onTap: () {
                debugPrint('Privacidad');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPrivacyPage(),
                  ),
                );
              },
            ),
            //AQUI LA TAB DE DEBUG
            ListTile(
              title: Text('DEBUG'),
              enabled: true,
              onTap: () {
                debugPrint('DEBUG');

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsDebugPage()));
              },
            ),

            /* POR AHORA NO HAY INFORMACION O SE PONE EN PRIVACIDAD
          ListTile(
            title: Text('Información'),
          ),
          */
          ],
        ));
  }
}

AppBar settingsAppBar = AppBar(
  title: Text('Ajustes'),
);
