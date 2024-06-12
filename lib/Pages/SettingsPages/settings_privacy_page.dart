import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SettingsPrivacyPage extends StatefulWidget {
  const SettingsPrivacyPage({super.key});

  @override
  State<SettingsPrivacyPage> createState() => _SettingsPrivacyPageState();
}


class _SettingsPrivacyPageState extends State<SettingsPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: settingsTimesAppBar,
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Política de Privacidad'),
              subtitle: Text ('Lee la política de Privacidad en mi página web'),
              enabled: true,
              onTap: () {
                Fluttertoast.showToast(
                  msg: '//TODO implementar esto',
                  backgroundColor: Colors.grey,
                );
              },
            ),
            ListTile(
              title: Text('Contacta conmigo'),
              subtitle : Text('Si tienes algun comentario o duda puedes mandarme un email.'),
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

AppBar settingsTimesAppBar = AppBar(
  title: Text('Privacidad'),
  backgroundColor: Colors.blue[100],
  //TODO poner un botón aqui?

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
