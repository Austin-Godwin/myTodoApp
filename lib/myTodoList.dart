import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/widget/todoClass.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class MyTodoList extends StatefulWidget {
  const MyTodoList({Key? key}) : super(key: key);

  @override
  _MyTodoListState createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  final _todoList = <Todo>[];
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  // final firestore = FirebaseFirestore.instance;
  // CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  //
  // Future<void> addMessages() async{
  //   // return messages.add(data);
  // }

  // DateTime _dateTime = DateTime.now();
  String getDate() {
    final dateFormat = DateFormat("EEEE, MMMM d");
    final date = dateFormat.format(DateTime.now());

    return date;
  }

  void _deleteTodo(Todo arg) {
    setState(() {
      _todoList.removeWhere((todo) => todo.name == arg.name);
    });
  }

  void _addTodoItem(String title) {
    final todo = new Todo(name: title);
    setState(() {
      _todoList.add(todo);
    });
    _textController.clear();
  }
  // bool _isChecked = false;

  TextStyle? _getTextStyle(bool checked) {

    if(!checked) {
      return TextStyle(fontSize: 20.0);
    }
    return TextStyle(
        fontSize: 20.0,
      color: Colors.red,
      decoration: TextDecoration.lineThrough,
      fontStyle: FontStyle.italic
    );
  }

  // Widget _dateTimeToText(bool value) {
  //   final date = Todo(name: "");
  //   final myTime = date.time;
  //   return Row(
  //     children: [
  //       Text(myTime, style: _getTextStyle(value)?.copyWith(fontSize: 15.0),),
  //       SizedBox(width: 20.0,),
  //       // Text(myTime.toString(), style: _getTextStyle(value)?.copyWith(fontSize: 15.0),),
  //   SizedBox(width: 20.0,)
  //     ],
  //   );
  // }

  Widget _buildTodoItem(String title, Widget time, void onChanged(bool), bool value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: CheckboxListTile(
          title: Text(title, style: _getTextStyle(value)),
          subtitle: time,
          onChanged: onChanged,
          value: value,
        ),
      ),
    );
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("What do you need to do today?", style: TextStyle(fontSize: 20.0),),
                const Text("Add your task", style: TextStyle(fontSize: 20.0),),
              ],
            ),
            content: Container(
              constraints: BoxConstraints(maxHeight: 150),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: const InputDecoration(hintText: "Enter Task Here"),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                    SizedBox(height: 10.0,),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top: 25.0),
                        decoration: BoxDecoration(color: Colors.green[200]),
                        alignment: Alignment.center,
                        width: _width / 3,
                        height: _height / 15,
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    return _todoList.map((todo) {
      return _buildTodoItem(todo.name, todo.time, (bool) {
        setState(() {
          todo.isChecked = bool;
          if (todo.isChecked) {
            todo.clock = Timer(Duration(seconds: 3), () {
              _deleteTodo(todo);
            });
          } else {
            if (todo.clock != null) {
              todo.clock!.cancel();
            }
          }
        });
      }, todo.isChecked);
    }).toList();
  }

  // List<Widget> _removeItems(String index) {
  //   final _removeTodo = <Widget>[];
  //   for (Todo todo in _todoList) {
  //     if (todo.isChecked) _removeTodo.remove(index);
  //   }
  //   return _removeTodo;
  // }

  @override
  void initState() {
    super.initState();
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
                            flex: 2,
                            child: Container(
                              // color: Colors.white54,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    getDate(),
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 18.0),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Icon(
                                    CupertinoIcons.calendar_today,
                                    color: Colors.green[600],
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
