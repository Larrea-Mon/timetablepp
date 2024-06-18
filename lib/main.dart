import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/holder_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Timetable ++',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            elevation: 2,
            shadowColor: Colors.black,  
          ),
          datePickerTheme: DatePickerThemeData(
            
            surfaceTintColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber.shade400)
        ),
        home: HolderPage(),
      )
    );
  }
}


class MyAppState extends ChangeNotifier {
  
}