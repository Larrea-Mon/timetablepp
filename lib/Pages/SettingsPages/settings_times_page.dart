import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timetablepp/Control/main_controller.dart';

class SettingsTimesPage extends StatefulWidget {
  const SettingsTimesPage({super.key});

  @override
  State<SettingsTimesPage> createState() => _SettingsTimesPageState();
}

class _SettingsTimesPageState extends State<SettingsTimesPage> {
  @override
  Widget build(BuildContext context) {
    ListTile tile0 = ListTile(
      title: Text('Lecciones por día'),
      subtitle: Text('TODO lecciones'),
      enabled: true,
      onTap: () {
        todoButton();
      },
    );
    ListTile tile1 = ListTile(
      title: Text('Duración por defecto de las lecciones'),
      subtitle: Text('TODO minutos(s)'),
      enabled: true,
      onTap: () {
        todoButton();
      },
    );
    ListTile tile2 = ListTile(
      title: Text('Tiempo por defecto entre clases'),
      subtitle: Text('TODO minuto(s)'),
      enabled: true,
      onTap: () {
        todoButton();
      },
    );

    Column mainColumn = Column(
      children: [
        tile0,
        const Divider(),
        tile1,
        const Divider(),
        tile2,
        const Divider(),
        Container(
          constraints: Bo,
          color:Colors.green,
          child:   Text(
          'Horas de inicio de las lecciones',
          textAlign: TextAlign.left,
         ),
        ),
      
      ],
    );
    //TODO MainColumn.children.add(),
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: settingsTimesAppBar,
      body: mainColumn,
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
