import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

import 'Styles.dart';
import 'colors.dart';


class ConfessionPage extends StatelessWidget {
  final String doodleLink = "https://dasandal.doodle.com/poll/2htk76vv6hubvi6v";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Spowiedź", //TODO: Replace with string from strings.dart,
            style: Style.titleTextStyle,
          ),
          iconTheme: IconThemeData(
              color: colors['appbarIconTheme']
          ),),
        body: new Center(
            child: new RaisedButton(
                onPressed:  (){
                  Launcher.launch(doodleLink);
                }
            )
        )
    );
  }
}