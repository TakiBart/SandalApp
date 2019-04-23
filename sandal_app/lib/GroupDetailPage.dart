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
        color: Colors.deepOrange,
        child: new Stack (
          children: <Widget>[
            _getBackground(),
            _getGradient(),
//            _getContent(),
//            _getToolbar(context),
          ],
        )
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            // TODO: Enhance design (rather create any :P).
//            new Hero(
//              tag: "group-hero-${group.id}",
//              child: new Image.asset(
//                group.image,
//                width: 96.0,
//                height: 96.0,
//              ),
//            ),
//            new Text(group.name),
//            new Text(group.description),
//          ],
//        ),
      ),
    );
  }

  Container _getBackground(){
    return new Container(
      child: new Image.network(Group.picture,
      fit: BoxFit.cover,
      height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00000000),
            Colors.deepOrange,
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

//  Widget _getContent

}