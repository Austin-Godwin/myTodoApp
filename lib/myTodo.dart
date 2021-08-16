
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widget/myCard.dart';

class MyTodo extends StatefulWidget {
  const MyTodo({Key? key}) : super(key: key);

  @override
  _MyTodoState createState() => _MyTodoState();
}

class _MyTodoState extends State<MyTodo> {
  

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 100.0,
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     "To do",
      //     style: TextStyle(
      //       fontSize: 35.0,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black54,
      //     ),
      //   ),
      //   actions: <Widget>[
      //     Container(
      //       // color: Colors.white54,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           Text(
      //             "Monday, March 12",
      //             style: TextStyle(color: Colors.black54),
      //           ),
      //           SizedBox(
      //             width: 5.0,
      //           ),
      //           Icon(
      //             CupertinoIcons.calendar_today,
      //             color: Colors.black54,
      //           )
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       width: 25.0,
      //     ),
      //     Container(
      //       // color: Colors.white54,
      //       child: Icon(Icons.more_vert,
      //         color: Colors.black54,
      //         size: 30.0,
      //       ),
      //     ),
      //   ],
      // ),
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
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard()
                    ],
                  ),
                ),
              ),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: TextField(
              //       textAlignVertical: TextAlignVertical.center,
              //       style: TextStyle(color: Colors.black54, fontSize: 18.0),
              //       decoration: InputDecoration(
              //         hintText: "What do you need to do?",
              //         border: OutlineInputBorder(
              //             borderSide: BorderSide(),
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(20.0))),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width / 2,
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //       top: 0.0,
              //       bottom: 8.0,
              //       left: 8.0,
              //       right: 8.0,
              //     ),
              //     child: ElevatedButton(
              //       onPressed: () {},
              //       style: ButtonStyle(),
              //       child: Padding(
              //         padding: const EdgeInsets.all(15.0),
              //         child: Text(
              //           "SAVE",
              //           style: TextStyle(
              //               fontSize: 20.0, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
