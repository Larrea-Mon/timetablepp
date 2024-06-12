import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsTimesPage extends StatefulWidget {
  const SettingsTimesPage({super.key});

  @override
  State<SettingsTimesPage> createState() => _SettingsTimesPageState();
}

class _SettingsTimesPageState extends State<SettingsTimesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: settingsTimesAppBar,
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            title: Text('Lecciones por día'),
            subtitle: Text('TODO lecciones'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
          ListTile(
            title: Text('Duración por defecto de las lecciones'),
            subtitle: Text('TODO minutos(s)'),
            enabled: true,
            onTap: () {
              Fluttertoast.showToast(
                msg: '//TODO implementar esto',
                backgroundColor: Colors.grey,
              );
            },
          ),
          ListTile(
            title: Text('Tiempo por defecto entre clases'),
            subtitle: Text('TODO minuto(s)'),
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

AppBar settingsTimesAppBar = AppBar(
  title: Text('Horario'),
  backgroundColor: Colors.blue[100],
  //TODO poner un botón aqui?

  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
