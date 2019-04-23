import 'package:flutter/material.dart';

import './Group.dart';
import './GroupRow.dart';

class GroupsPageBody extends StatelessWidget {
  final name;

  GroupsPageBody(this.name);

  @override
  Widget build(BuildContext context) {
//    return new GroupRow(name, groups[0]);
    return new Expanded(

    // Way with ListView.builder
//      child: ListView.builder(
//        itemBuilder: (context, index) => new GroupRow(name, groups[index]),
//        itemCount: groups.length,
//        itemExtent: 152.0,
//        padding: new EdgeInsets.symmetric(vertical: 16.0),
//      ),

    // Way with Slivers
    child: new Container(
      // Background
      color: Colors.white,
      child: new CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            sliver: new SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate(
                  (context, index) => new GroupRow(name, groups[index]),
                childCount: groups.length,
              ),
              itemExtent: 152.0,
            ),
          ),
        ],
      ),
    ),
    );
  }
}