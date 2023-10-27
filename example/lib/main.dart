import 'package:flutter/material.dart';
import 'package:week_date_picker/week_date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date picker"),
      ),
      body: Column(
        children: [
          WeekDatePickerView(
            changeDay: (value) => setState(() {
              _selectedDay = value;
            }),
            selectedDay: _selectedDay,
            config: WeekDataPickerConfig(
              enableWeekNumberText: true,
              enableMonthText: true,
              weekDayType: WeekDayType.TYPE_3,
              weekPosition: WeekPosition.LEFT,
              weekDayCapitalize: true,
            ),
          ),

          30.sizeH,

          Text("Date: ${_selectedDay.day} , Month: ${_selectedDay.month} , Year: ${_selectedDay.year}"),
        ],
      ),
    );
  }
}
