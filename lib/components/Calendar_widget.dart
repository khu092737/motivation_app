import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatefulWidget
{
  const calendar({Key? key}) : super(key: key);
  @override
   calendarState createState() => calendarState();
}

class calendarState extends State<calendar>
{

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(2024),
      lastDay: DateTime(2040),
      locale: 'ko-KR',
      daysOfWeekHeight: 30,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: true,
        rightChevronVisible: true
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0
          )
        )
      ),

    );
  }
}

class Stamp_cal
{
  final DateTime date;
  Stamp_cal({required this.date});
}