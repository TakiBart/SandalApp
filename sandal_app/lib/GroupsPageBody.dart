import 'package:flutter/material.dart';

import './Group.dart';
import './GroupSummary.dart';

class GroupsPageBody extends StatelessWidget {
  final name;

  GroupsPageBody(this.name);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
    // Way with Slivers
    child: new Container(
      // Background
      color: Colors.indigo,
      child: new CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            sliver: new SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate(
                  (context, index) => new GroupSummary(groups[index]),
                childCount: groups.length,
              ),
              itemExtent: 192.0,
            ),
          ),
        ],
      ),
    ),
    );
  }
}