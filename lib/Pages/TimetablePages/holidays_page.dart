// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Pages/TimetablePages/ExtraPages/addholiday_page.dart';

import '../../Models/holidayperiod.dart';

class HolidaysPage extends StatefulWidget {
  const HolidaysPage({super.key});

  @override
  State<HolidaysPage> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  @override
  Widget build(BuildContext context) {
    AppBar holidaysViewAppBar = AppBar(
      title: Text('Vacaciones'),
      backgroundColor: Colors.blue[100],
      actions: <Widget>[
        IconButton(
          onPressed: () {
            MainController().resetCurrentHoliday();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddHolidayPage()));
          },
          icon: Icon(Icons.add_box),
        )
      ],
      /*actions: <Widget>[
    PopupMenuButton(itemBuilder: itemBuilder)
  ],*/
    );

    List<HolidayPeriod> holidays = MainController().getHolidays();
    /*for (var i = 0; i < holidays.length; i++) {
      print(holidays[i].toString());
    }*/

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: holidaysViewAppBar,
        body: Column(
          children: [
            TopListTile(),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Flexible(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) =>
                    Divider(thickness: 1, color: Colors.black),
                shrinkWrap: false,
                itemCount: holidays.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(holidays[index].getName()),
                    subtitle: Text(holidays[index].getStartAsString() +' - ' +holidays[index].getEndAsString()),
                    onTap: () {
                      MainController().setCurrentHoliday(holidays[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddHolidayPage()));
                    },
                  );
                },
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomListTile(),
            ),
          ],
        )
        //body: Placeholder(),
        );
  }
}

class TopListTile extends StatefulWidget {
  const TopListTile({super.key});
  final String startDate = '-';
  @override
  State<TopListTile> createState() => TopListTileState();
}

class TopListTileState extends State<TopListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Inicio del período'),
      subtitle: Text(MainController().getTermPeriod().startDateToString()),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          MainController().setTermPeriodStart(pickedDate);
          setState(() {});
        } else {
          debugPrint("not selected");
        }
      }, //onTap
    );
  }
}

class BottomListTile extends StatefulWidget {
  const BottomListTile({super.key});
  final String enddate = '-';
  @override
  State<BottomListTile> createState() => BottomListTileState();
}

class BottomListTileState extends State<BottomListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Final del período'),
      subtitle: Text(MainController().getTermPeriod().endDateToString()),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2099));

        if (pickedDate != null) {
          debugPrint(pickedDate.toString());
          MainController().setTermPeriodEnd(pickedDate);
          setState(() {});
        } else {
          debugPrint("not selected");
        }
      }, //onTap
    );
  }
}
