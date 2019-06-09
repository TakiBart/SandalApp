import 'package:Sandal/strings.dart';
import 'package:flutter/material.dart';

import './tempSubMenu.dart';
import './Groups.dart';
import './ConfessionPage.dart';
import 'GalleryPage.dart';
import './CalendarGeneral.dart';
import './CommentPage.dart';

List list = [
  {
    "id": "tempSubMenu",
    "name": "Komentarz",
    "icon": Icons.comment,
    // TODO: Ikona będzie pokolorowana czy przekazujemy kolor (albo dwa)?
    "color": Colors.orange,
    "builder": (_) =>
      new CommentPage()
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
    "id": "calendar",
    "name": "Kalendarz",
    "icon": Icons.calendar_today,
    "color": Colors.orange,
    "builder": (_) =>
      new CalendarGeneralPage(key: Key('key'), title: strings['calendarSectionTitle']),
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