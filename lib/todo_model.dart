import 'dart:convert';

import 'package:flutter/material.dart';

class Todo {
  late final String title;
  bool isComplete;

  Todo({required this.title, this.isComplete = false});
}
