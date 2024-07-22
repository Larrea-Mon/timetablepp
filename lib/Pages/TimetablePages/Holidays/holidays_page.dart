// ignore_for_file: prefer_const_constructors, unnecessary_import,
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetablepp/Control/database_controller.dart';
import 'package:timetablepp/Control/main_controller.dart';
import 'package:timetablepp/Pages/TimetablePages/Holidays/add_holiday_page.dart';
import 'package:timetablepp/Pages/TimetablePages/Holidays/edit_holiday_page.dart';

import '../../../Models/holidayperiod.dart';

class HolidaysPage extends StatefulWidget {
  const HolidaysPage({super.key});

  @override
  State<HolidaysPage> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  @override
  Widget build(BuildContext context) {
    buildHolidaysAppBar() {
      return AppBar(
        title: Text('Vacaciones'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              MainController().resetCurrentHoliday();
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddHolidayPage()))
                  .then((_) => setState(() {}));
            },
            icon: Icon(Icons.add_box),
          )
        ],
      );
    }

    List<HolidayPeriod> holidays = DatabaseController().getAllHolidayPeriods();

    Scaffold myScaffold = Scaffold(
        appBar: buildHolidaysAppBar(),
        body: Column(
          children: [
            TopListTile(),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                itemCount: holidays.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(holidays[index]
                        .getName() /* + ' DEBUG: ID: ' + holidays[index].id.toString()*/),
                    subtitle: Text(
                        '${holidays[index].getStartAsString()} - ${holidays[index].getEndAsString()}'),
                    onTap: () {
                      MainController().setCurrentHoliday(holidays[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditHolidayPage())).then(
                        (_) => setState(() {}),
                      );
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
    return myScaffold;
  }
}

class TopListTile extends StatefulWidget {
  const TopListTile({super.key});
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
