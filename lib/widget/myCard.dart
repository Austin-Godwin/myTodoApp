import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool firstValue = false;
  bool secondValue = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CheckboxListTile(
          selected: false,
          onChanged: (bool){
            setState(() {
              this.firstValue;
            });
          },
          secondary: Icon(CupertinoIcons.check_mark_circled, color: Colors.green, size: 30.0,),
          title: Text("Morning Prayer"),
          subtitle: Text("11:15pm"),
          value: this.firstValue,
        ),
      ),
    );
  }
}
