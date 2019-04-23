import 'package:flutter/material.dart';

import './Group.dart';

class GroupDetailPage extends StatelessWidget{
  final Group group;

  GroupDetailPage(this.group);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Group Detail"),
//      ),
//      body: new Center(
//        child: new RaisedButton(
//          onPressed: () => Navigator.pop(context),
//          child: new Text("<- Go back"),
//        ),
//      ),
      body: new Container(
        constraints: new BoxConstraints.expand(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO: Enhance design (rather create any :P).
            new Image.asset(group.image, width: 96.0, height: 96.0,),
            new Text(group.name),
            new Text(group.description),
          ],
        ),
      ),
    );
  }
}