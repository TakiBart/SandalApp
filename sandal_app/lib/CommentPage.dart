import 'package:flutter/material.dart';

import './Styles.dart';
import './colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentPage extends StatelessWidget{

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
  }
}