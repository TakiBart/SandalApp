import 'package:flutter/material.dart';

import './Group.dart';

class GroupRow extends StatelessWidget {
  final name;

//  final groupThumbnail = new Container(
//    margin: new EdgeInsets.symmetric(
//      vertical: 16.0,
//    ),
//    alignment: FractionalOffset.centerLeft,
//    child: new Image(
//      image: new AssetImage("assets/img/temp.png"),
//      height: 92.0,
//      width: 92.0,
//    ),
//  );
  final groupCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );

  final Group group;

  GroupRow(this.name, this.group);

  @override
  Widget build(BuildContext context) {
//    final groupCardContent = new Container

    return new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            groupCard,
            new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              alignment: FractionalOffset.centerLeft,
              child: new Image(
//                image: new AssetImage("assets/img/$name.png"),
                image: new AssetImage(group.image),
                height: 92.0,
                width: 92.0,
              ),
            ),
//            groupThumbnail,
          ],
        )
    );
  }
}