// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:timetablepp/Control/main_controller.dart';


class SettingsPrivacyPage extends StatefulWidget {
  const SettingsPrivacyPage({super.key});

  @override
  State<SettingsPrivacyPage> createState() => _SettingsPrivacyPageState();
}


class _SettingsPrivacyPageState extends State<SettingsPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: settingsTimesAppBar,
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Política de Privacidad'),
              subtitle: Text ('Lee la política de Privacidad en mi página web'),
              enabled: true,
              onTap: () {
               todoButton();
              },
            ),
            ListTile(
              title: Text('Contacta conmigo'),
              subtitle : Text('Si tienes algun comentario o duda puedes mandarme un email.'),
              enabled: true,
              onTap: () {
                todoButton();
              },
            ),
          ],
        ));
  }
}

AppBar settingsTimesAppBar = AppBar(
  title: Text('Privacidad'),
  //TODO poner un botón aqui?

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
