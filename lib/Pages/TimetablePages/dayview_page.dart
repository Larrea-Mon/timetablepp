// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:timetablepp/Control/main_controller.dart';

class DayViewPage extends StatefulWidget {
  const DayViewPage({super.key});

  @override
  State<DayViewPage> createState() => _DayViewPageState();
}

class _DayViewPageState extends State<DayViewPage> {
  late Color dialogPickerColor;

  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(MainController().getSubjectColorsMap['sky']):
        'sky',
    ColorTools.createPrimarySwatch(
        MainController().getSubjectColorsMap['orange']): 'orange',
    ColorTools.createPrimarySwatch(
        MainController().getSubjectColorsMap['lila']): 'lila',
  };

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text('Select Color'),
      enableShadesSelection: false,
      //showMaterialName: true,
      //showColorName: true,
      //showColorCode: true,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: false,
        ColorPickerType.customSecondary: false,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      transitionBuilder: (BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget widget) {
        final double curvedValue =
            Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(opacity: a1.value, child: widget),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints:
          const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }

  @override
  void initState() {
    super.initState();
    dialogPickerColor = Colors.red; // Material red.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dayViewAppBar,
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Selector de colores'),
              trailing: ColorIndicator(
                width: 44,
                height: 44,
                borderRadius: 22,
                color: dialogPickerColor,
                onSelectFocus: false,
                onSelect: () async {
                  final Color colorBeforeDialog = dialogPickerColor;

                  if (!(await colorPickerDialog())) {
                    setState(() {
                      dialogPickerColor = colorBeforeDialog;
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

AppBar dayViewAppBar = AppBar(
  title: Text('Vista Diaria'),


  /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
);
