import 'package:Sandal/strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

import 'Styles.dart';
import 'colors.dart';


class ConfessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(strings['doodleLink'], //TODO: Replace with string from strings.dart,
            style: Styles.titleTextStyle,
          ),
          iconTheme: IconThemeData(
              color: colors['appbarIconTheme']
          ),),
        body: new Center(
            child: new RaisedButton(
                onPressed:  (){
                  Launcher.launch(strings['doodleLink']);
                }
            )
        )
    );
  }
}