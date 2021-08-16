import 'dart:async';

class Todo {
  final String name;
  bool isChecked;
  Timer? clock;
  Todo({required this.name, this.isChecked = false, this.clock});
}
