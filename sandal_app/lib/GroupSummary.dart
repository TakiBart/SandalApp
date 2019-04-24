import 'package:flutter/material.dart';

import './Group.dart';
import './GroupDetailPage.dart';
import './TextStyles.dart';

// TODO: Some cleanups.

class GroupSummary extends StatelessWidget {
  final Group group;

  // Field below probably won't be used.
  final bool horizontal;

  GroupSummary(this.group, {this.horizontal = true});

  GroupSummary.vertical(this.group) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final groupCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            group.shortName,
            // TODO: Text styles
            style: Style.headerTextStyle,
            textAlign: TextAlign.center,
          ),
          new Container(
            height: 10.0,
          ),
          new Text(
            group.time,
            style: Style.smallTextStyle,
          ),
          // TODO: If there is no leader, don't show Expanded below.
          new Expanded(
            child: Column(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: 2.0,
                  width: 18.0,
                  alignment: Alignment.bottomLeft,
                  // TODO: Change color.
                  // TODO: Move colors to some res/colors.
                  // TODO: Arrange GroupSummary view.
                  color: Colors.white70,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Expanded(
                      flex: horizontal ? 1 : 0,
                      child: Row(
                        children: <Widget>[
                          new Container(height: 12.0),
                          new Container(width: 8.0),
                          new Text(
//                            group.leader == null ? 'noLeader' : group.leader,
                            group.shortDescription,
                            style: Style.smallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final groupCard = new Container(
      child: groupCardContent,
      height: horizontal ? 174.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
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
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "group-hero-${group.id}",
        child: Container(
          height: 92.0,
          width: 92.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              image: new AssetImage(group.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );

    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new GroupDetailPage(group),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: new Container(
//      height: 120.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              groupCard,
              groupThumbnails,
            ],
          )),
    );
  }
}
