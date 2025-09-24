import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thoi_khoa_bieu/drawer.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Table")),
      drawer: App_Drawer(),
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2000),
        lastDay: DateTime.utc(2100),

        //Fomat
        calendarFormat: CalendarFormat.week,

        //Click day
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addTimeTable,
        child: Icon(Icons.add),
      ),
    );
  }

  void addTimeTable() {}
}
