import 'package:flutter/material.dart';

import './Group.dart';
import './GroupRow.dart';

class GroupsPageBody extends StatelessWidget {
  final name;

  GroupsPageBody(this.name);

  @override
  Widget build(BuildContext context) {
    return new GroupRow(name, groups[0]);
  }
}