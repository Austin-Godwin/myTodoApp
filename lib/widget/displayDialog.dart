import 'package:flutter/material.dart';

Future<AlertDialog> _displayDialog(BuildContext context, TextEditingController controller, Function addTodoItem) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add a task to your list"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter Task Here"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                addTodoItem(controller.text);
              },
              child: const Text('ADD'),
            ),TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL'),
            ),
          ],
        );
      });
}
