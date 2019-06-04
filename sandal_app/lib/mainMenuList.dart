import 'package:flutter/material.dart';

import './tempSubMenu.dart';
import './Groups.dart';
import './ConfessionPage.dart';
import 'GalleryPage.dart';

List list = [
  {
    "id": "tempSubMenu",
    "name": "Komentarz",
    "icon": Icons.comment,
    // TODO: Ikona będzie pokolorowana czy przekazujemy kolor (albo dwa)?
    "color": Colors.orange,
    "builder": (_) =>
//    new MyTempPage(
//      tempId: "tempSubMenu",
//      tempName: "Komentarz",
//      tempIcon: Icons.comment,
//      tempColor: Colors.orange,
//    )
      new CommentsSectionPage()
  },
  {
    "id": "tempSubMenu",
    "name": "MenuItem2",
    "icon": Icons.ac_unit,
    "color": Colors.orange,
    "builder": (_) =>
    new MyTempPage(
      tempId: "tempSubMenu",
      tempName: "MenuItem2",
      tempIcon: Icons.ac_unit,
      tempColor: Colors.orange,
    )
  },
  {
    "id": "groups",
    "name": "Grupy",
    "icon": Icons.group,
    "color": Colors.orange,
    "builder": (_) => new GroupsPage(title: 'Is it even needed?')
  },
  {
    "id": "tempSubMenu",
    "name": "MenuItem4 - spanko",
    "icon": Icons.airline_seat_individual_suite,
    "color": Colors.orange,
    "builder": (_) =>
    new GalleryPage()
  },
  {
    "id": "tempSubMenu",
    "name": "MenuItem5 - DanBus",
    "icon": Icons.airport_shuttle,
    "color": Colors.orange,
    "builder": (_) =>
    new MyTempPage(
      tempId: "tempSubMenu",
      tempName: "MenuItem5 - DanBus",
      tempIcon: Icons.airport_shuttle,
      tempColor: Colors.orange,
    )
  },
  {
    "id": "tempSubMenu",
    "name": "MenuItem6",
    "icon": Icons.directions_run,
    "color": Colors.orange,
    "builder": (_) =>
    new ConfessionPage()
  },
];