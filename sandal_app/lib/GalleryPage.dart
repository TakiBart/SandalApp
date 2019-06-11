import 'dart:io'; //delete after

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './Styles.dart';
import './colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import './strings.dart';
import 'package:image_picker/image_picker.dart';

import 'Authorization.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              strings['gallerySectionTitle'], //TODO: Get strings from strings.dart file
              style: Styles.titleTextStyle,
            ),
            iconTheme: IconThemeData(
              color: MyColors.appbarIconTheme,
            ),
            actions:<Widget>[
              new IconButton(
                  icon: new Icon(Icons.cloud_upload),
                  onPressed: () =>{_verifyUserBeforeUpload(context)}),
            ]
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('images').snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData)
                return Text(strings['pleaseWaitMessage']);
              return GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
              child: Image.network(document['url']),
            )
          ]
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return new DetailFullscreen(document['url'],document['title']);
        }));
      },
    );
  }

  void _verifyUserBeforeUpload(BuildContext context){
    if(LoginPage.user==null)
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    else
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseImagePage()));
  }
}
class DetailFullscreen extends StatelessWidget{
  final String imgUrl;
  final String imgTitle;
  DetailFullscreen(this.imgUrl, this.imgTitle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text(imgTitle,
                style: Styles.headerTextStyle),
          ),
          body: GestureDetector(
            child: Center(
              child: Image.network(imgUrl),
              ),
            onTap: (){ Navigator.pop(context); },
            ),
          ),
     );
  }
}