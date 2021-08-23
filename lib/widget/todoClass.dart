import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Todo {
  final String name;
  bool isChecked;
  Timer? clock;
  late final Widget time;
  // DateTime? dateTime;
  Todo ({required this.name, this.isChecked = false, this.clock})
  {
    // final date = DateTime.now();
    // assert(date.year == 2021);

    this.time = _timeToText();
  }

  // void getTime() {
  //   DateTime date = DateTime.now();
  //   // Set the time property
  //   this.time = date.toString();
  // }

  Widget _timeToText() {
    final timeFormat = DateFormat("hh:mm a");
    final time = timeFormat.format(DateTime.now());
    return Row(
      children: [
        // Text(date.day.toString() + "-" + date.month.toString() + "-" + date.year.toString()),
        // SizedBox(width: 20.0,),
        Text(time),
      ],
    );
  }
}


