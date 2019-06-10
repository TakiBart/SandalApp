import 'package:Sandal/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './Styles.dart';
import './colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentPage extends StatelessWidget{

  void _addMessage() async{

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(strings['commentSectionTitle'], style: Styles.headerTextStyle),
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
        ),
        floatingActionButton: FloatingActionButton(onPressed: _addMessage),
    );
  }
  Widget _buildListSingleItem(BuildContext context, DocumentSnapshot document){
    final priority = document['priority'];
    Icon leadIcon;
    if(priority == 1)
      leadIcon=Icon(Icons.alarm, color: Colors.red);
    else if(priority == 2)
      leadIcon = Icon(Icons.alarm, color: Colors.orange);
    else
      leadIcon = Icon(Icons.message, color: Colors.green);
    return ListTile(
      leading: leadIcon,
      title: Column(

          children: <Widget>[
             Text(
                 document.data['author'] + ": "+ document.data['title'],
                 style:Theme.of(context).textTheme.title)
            ,
            Text(
                DateFormat("dd-MM-yyyy HH:mm").format(document['creationDate'].toDate())
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
              child: Text(
                  document['body'],
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.baseTextStyle,
                  maxLines: 2,
              )
            )

          ]),
      trailing: Icon(Icons.arrow_forward),
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