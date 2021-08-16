import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTodoList extends StatefulWidget {
  const MyTodoList({Key? key}) : super(key: key);

  @override
  _MyTodoListState createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  final _todoList = <String>[];
  List<bool> checkBoxesCheckedStates = [false];
  final TextEditingController _textController = TextEditingController();

  DateTime _dateTime = DateTime(
    DateTime.now().day,
    DateTime.now().month,
    DateTime.now().year,
  );

  void _addTodoItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    _textController.clear();
  }

  bool _isChecked = false;

  TextStyle? _getTextStyle(bool checked) {

    if(!checked) {
      return TextStyle(fontSize: 20.0);
    }
    return TextStyle(
        fontSize: 20.0,
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
      fontStyle: FontStyle.italic
    );
  }

  Widget _buildTodoItem(String title, DateTime subtitle, void onChanged(bool), bool value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: CheckboxListTile(
          title: Text(title, style: _getTextStyle(value)),
          subtitle: Text("$subtitle"),
          onChanged: onChanged,
          value: value,
        ),
      ),
    );
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add a task to your list"),
            content: TextField(
              controller: _textController,
              decoration: const InputDecoration(hintText: "Enter Task Here"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textController.text);
                },
                child: const Text('ADD'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('CANCEL'),
              ),
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(
        _buildTodoItem(title, _dateTime, (bool) {
          setState(() {
                _isChecked = bool;
              });
        }, _isChecked)
      );
    }
    return _todoWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                // color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                                // color: Colors.white,
                                child: Text("To Do",
                                    style: textTheme.headline4
                                        ?.copyWith(color: Colors.black54))),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.white54,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Monday, March 12",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 18.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.calendar_today,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // color: Colors.white54,
                            child: IconButton(
                              alignment: Alignment.centerRight,
                              splashRadius: 20.0,
                              iconSize: 30.0,
                              onPressed: () {},
                              icon: Icon(Icons.more_vert),
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _getItems(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          elevation: 3.0,
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Icon',
          child: Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}
