import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

import 'Styles.dart';
import 'colors.dart';


class ConfessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: _ConfessionPage(title: 'DA Sandał'),
    );
  }
}
class _ConfessionPage extends StatefulWidget {
  _ConfessionPage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _ConfessionPageState createState() => _ConfessionPageState();
}

class _ConfessionPageState extends State<_ConfessionPage>{
  final String doodleLink = "https://dasandal.doodle.com/poll/2htk76vv6hubvi6v";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Spowiedź',
          style: Style.titleTextStyle),
          iconTheme: IconThemeData(color: MyColors.appbarIconTheme),
        ),
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

