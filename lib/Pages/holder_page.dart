// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:timetablepp/Pages/TimetablePages/all_pages.dart';



class HolderPage extends StatefulWidget{
  const HolderPage({super.key});

  @override
  State<HolderPage> createState() => _HolderPageState();
}

class _HolderPageState extends State<HolderPage> {

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context){

    Widget page;
    switch (selectedIndex){
      case 0:
        page = DashboardPage();
        break;
      case 1:
        page = DayViewPage();
        break;
      case 2:
        page = WeekViewPage();
        break;
      case 3:
        page = TasksPage();
        break;
      case 4:
        page = HolidaysPage();
        break;
      case 5:
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder( 
      builder: (context,constraints) {
        return Scaffold(
          body: Row(
            children:[
              SafeArea(
                child:NavigationRail(
                  extended:constraints.maxWidth >=400,
                  destinations:[
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.calendar_today),
                      label: Text('Dayview'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.calendar_month),
                      label: Text('Weekview'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.school_outlined),
                      label: Text('Tasks'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.airplane_ticket),
                      label: Text('Holidays'),
                    ),
                    // TODO anadir una linea de separacion

                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value){
                    setState((){
                      selectedIndex = value;
                    });
                    debugPrint('selected $value');
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color:Theme.of(context).colorScheme.primaryContainer,
                  child: page,   
                ),
              ),
            ],
          ),
        );
      }
    );
  }

}
