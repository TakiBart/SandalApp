import 'package:flutter/material.dart';

import './Group.dart';
import './GroupSummary.dart';
import './TextStyles.dart';

class GroupDetailPage extends StatelessWidget {
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
          color: Colors.deepOrangeAccent,
          child: new Stack (
            children: <Widget>[
              _getBackground(),
              _getGradient(),
              _getContent(),
            _getToolbar(context),
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

  Container _getBackground() {
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
            Colors.deepOrangeAccent,
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new GroupSummary(group, horizontal: false),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_overviewTitle,
                style: Style.headerTextStyle,
              ),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 8.0),
                height: 2.0,
                width: 18.0,
                color: Colors.purple,

              ),
              new Text(group.description,
                style: Style.commonTextStyle,
                // TODO: To justify or not to justify?
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top),
      child: new BackButton(color: Colors.white),

    );
  }

}