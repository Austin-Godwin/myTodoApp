import 'package:flutter/material.dart';

Future<AlertDialog> _displayDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 3.0,color: Colors.green.shade800), borderRadius: BorderRadius.circular(10.0)),
                // color: Colors.grey,
                width: MediaQuery.of(context).size.width/1.2,
                height: MediaQuery.of(context).size.height/2.8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("What do you need to do today?", style: TextStyle(fontSize: 20.0),),
                            const Text("Add your task", style: TextStyle(fontSize: 20.0),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        child: Column(
                          children: [
                            TextField(
                              // controller: _textController,
                              decoration: const InputDecoration(hintText: "Enter Task Here"),
                              textAlignVertical: TextAlignVertical.center,
                            ),
                            SizedBox(height: 20.0,),
                            InkWell(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: TextField(),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // _addTodoItem(_textController.text);
                            },
                            child: const Text('ADD'),
                          ),
                          SizedBox(width: 20.0,),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('CANCEL'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}