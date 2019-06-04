import 'dart:io'; //delete after

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './Styles.dart';
import './colors.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spowiedź',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: _GalleryPage(title: 'DA Sandał'),
    );
  }
}
class _GalleryPage extends StatefulWidget {
  _GalleryPage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<_GalleryPage>{


  final int imgCount =50;
  Widget _buildListSingleItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
      title: Column(
          children: <Widget>[
            Expanded(
                child: Image.network(document['url']),
                )
          ]
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Style.titleTextStyle,
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('images').snapshots(),
          builder: (context, snapshot){
            if(!snapshot.hasData)
              return Text("Proszę czekać");
            return GridView.builder(
               gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>_buildListSingleItem(context, snapshot.data.documents[index]),
            );
          }
      )
      );
  }
}
//Center(
//        child: new GridView.builder(
//            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 2,
//              mainAxisSpacing: 10.0,
//              crossAxisSpacing: 10.0,
////              childAspectRatio: 0.5,
//            ),
//            padding: const EdgeInsets.all(20.0),
//            itemCount: imgCount,
//            itemBuilder: (BuildContext context, int index) {
//              return new Container(
//                // TODO: Change sizes not to be hardcoded #2
//                child: GestureDetector(
//                  child: Container(
//                    margin: EdgeInsets.all(15.0),
//                    child:Container(
//                      decoration: new BoxDecoration(
//                        shape: BoxShape.rectangle,
//                        color: colors['iconBackground'],
//                      ),
//                    ),
//                  ),
//                ),
//              );
//            }),