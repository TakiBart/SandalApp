import 'package:flutter/material.dart';

class MyTempPage extends StatefulWidget {
  MyTempPage(
      {Key key,
      this.title = 'tempTitle',
      this.tempId = 'tempId',
      this.tempName = 'tempName',
      this.tempIcon = Icons.not_interested,
      this.tempColor = Colors.purple
      }) : super(key: key);

  final String title;
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'id = ' + tempId,
            ),
            Text(
              'name = ' + tempName,
            ),
            Icon(
              tempIcon,
              color: tempColor,
            ),
          ],
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