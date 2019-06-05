import 'dart:io'; //delete after

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './Styles.dart';
import './colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:image_picker/image_picker.dart';

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
          return new DetailFullscreen(document['url'],document['author']);
        }));
       },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Galeria',
          style: Style.titleTextStyle,
        ),
          iconTheme: IconThemeData(
            color: MyColors.appbarIconTheme,
          ),
        actions:<Widget>[
          new IconButton(icon: new Icon(Icons.cloud_upload), onPressed: _chooseImage)
        ]
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
class DetailFullscreen extends StatelessWidget{
  final String imgUrl;
  final String imgAuthor;
  DetailFullscreen(this.imgUrl, this.imgAuthor);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Autor: ' + imgAuthor,
                style: Style.headerTextStyle),
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

Future _chooseImage() async{

//  var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
  File image;
  if(image!=null){
    final StorageReference sr = FirebaseStorage.instance.ref().child('newfile.jpg');
    final StorageUploadTask task = sr.putFile(image);
  }

  //TODO: push to Storage, and copy URL to cloud firestore (create a new document)
}