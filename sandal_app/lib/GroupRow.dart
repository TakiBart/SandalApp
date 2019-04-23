import 'package:flutter/material.dart';

import './Group.dart';
import './GroupDetailPage.dart';
import './TextStyles.dart';

class GroupRow extends StatelessWidget {
  final name;
  final Group group;

  GroupRow(this.name, this.group);

  @override
  Widget build(BuildContext context) {
    final groupCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(group.name,
            // TODO: Text styles
            style: Style.titleTextStyle,
          ),
          new Container(height: 10.0,),
          new Text(group.time,
            style: Style.smallTextStyle,
          ),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            // TODO: Change color.
            color: Colors.purple,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: Row(
                  children: <Widget>[
                    new Container(height: 12.0,),
                    new Container(width: 8.0,),
                    new Text(group.leader == null ? 'noLeader' : group.leader,
                      style: Style.smallTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );

    final groupCard = new Container(
      child: groupCardContent,
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

    final groupThumbnails = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: new Hero(
        tag: "group-hero-${group.id}",
        child: Image(
          image: new AssetImage(group.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    return new GestureDetector(
      onTap: () => Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (_,__,___) => new GroupDetailPage(group),
      )),
      child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              groupCard,
              groupThumbnails,
            ],
          )
      ),
    );
  }
}