import 'package:flutter/material.dart';

import './GroupsPageBody.dart';

class GroupsPage extends StatelessWidget {
  GroupsPage(
      {Key key,
        this.title = 'DA Sandal2'
      }) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // TODO: Make one appbar for whole app
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          new GroupsPageBody('temp')
        ],
      ),
    );
  }

}