import 'package:flutter/material.dart';
//import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/services.dart';

import './Styles.dart';
import './colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CommentsSectionPage extends StatefulWidget{
  @override
  _CommentsListedPageState createState() => _CommentsListedPageState();
}
class _CommentsListedPageState extends State<CommentsSectionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Komentarz", style: Style.headerTextStyle),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),

      body: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Text("Proszę czekać");
          return ListView.builder(
            itemExtent: 100,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>_buildListSingleItem(context, snapshot.data.documents[index]),
          );
        }
      )
    );
  }
  Widget _buildListSingleItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
        title: Column(
            children: <Widget>[
              Expanded(
                  child: Text(
                      document.data['author'] + ": "+ document.data['title'],
                      style:Theme.of(context).textTheme.headline
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      document.data['body'])
              ),
            ]),
    onTap: () =>{
      Navigator.push((context), MaterialPageRoute(builder: (context) => _CommentDetailsPage(document['title'],document['author'],document['body'])))
    },);
  }
}
class _CommentDetailsPage extends StatelessWidget{
  String title;
  String author;
  String body;

  _CommentDetailsPage(String title, String author, String body){
    this.title=title;
    this.author=author;
    this.body=body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),
      body:
        Container(
          child: Column(
            children: <Widget>[
              Text(author),
              Text(body),
            ],
          ),
      )

    );
    // TODO: implement build
    // arrow to get back to listed state
//    return null;
  }

}

class MyTempPage extends StatefulWidget {
  MyTempPage(
      {Key key,
      this.tempId = 'tempId',
      this.tempName = 'tempName',
      this.tempIcon = Icons.not_interested,
      this.tempColor = Colors.purple})
      : super(key: key);

  final tempId;
  final tempName;
  final tempIcon;
  final tempColor;

  @override
  _MyTempPageState createState() => _MyTempPageState(
        tempId: tempId,
        tempName: tempName,
        tempIcon: tempIcon,
        tempColor: tempColor,
      );
}

class _MyTempPageState extends State<MyTempPage> {
  _MyTempPageState({this.tempId, this.tempName, this.tempIcon, this.tempColor});

  int _counter = 0;
  final String tempId;
  final String tempName;
  final tempIcon;
  final tempColor;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tempName,
          style: Style.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),
      body: Container(
        color: Colors.indigoAccent,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Style.headerTextStyle,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Text(
                'id = $tempId',
                style: Style.commonTextStyle,
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Icon(
                  tempIcon,
                  color: tempColor,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
