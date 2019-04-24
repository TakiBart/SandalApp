import 'package:flutter/material.dart';

import './TextStyles.dart';

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
          style: Style.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.indigoAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Style.headerTextStyle,
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
                style: Style.commonTextStyle,
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
