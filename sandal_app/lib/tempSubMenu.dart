import 'package:flutter/material.dart';

import './Styles.dart';
import './colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyTempPage extends StatefulWidget {
  MyTempPage(
      {Key key,
      this.tempId = 'tempId',
      this.tempName = 'tempName',
      this.tempIcon = Icons.not_interested,
      this.tempColor = Colors.purple})
      : super(key: key);

  final tempId;
  final tempName;
  final tempIcon;
  final tempColor;

  @override
  _MyTempPageState createState() => _MyTempPageState(
        tempId: tempId,
        tempName: tempName,
        tempIcon: tempIcon,
        tempColor: tempColor,
      );
}

class _MyTempPageState extends State<MyTempPage> {
  _MyTempPageState({this.tempId, this.tempName, this.tempIcon, this.tempColor});

  int _counter = 0;
  final String tempId;
  final String tempName;
  final tempIcon;
  final tempColor;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tempName,
          style: Styles.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),
      body: Container(
        color: Colors.indigoAccent,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Styles.headerTextStyle,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Text(
                'id = $tempId',
                style: Styles.commonTextStyle,
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Icon(
                  tempIcon,
                  color: tempColor,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
