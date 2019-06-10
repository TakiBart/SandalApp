import 'dart:io';

import 'package:Sandal/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'Styles.dart';
import 'colors.dart';



class LoginPage extends StatefulWidget{
  static FirebaseUser _user;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();

  static FirebaseUser get user => _user;
}
class _LoginPageState extends State<LoginPage>{
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings['signInRequiredMessage'],
          style: Styles.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: new EdgeInsets.all(15),
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: new TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: new InputDecoration(
                        hintText: strings['email'],
                        icon: new Icon(
                          Icons.mail,
                          color: Colors.grey,
                        )),
                    validator: (input) {
                      if(input.isEmpty || !input.contains('@')){
                        return strings['incorrectEmailInput'];
                      }
                    },
                    onSaved: (input) => _email = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: new TextFormField(
                    obscureText: true,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: new InputDecoration(
                        hintText: strings['password'],
                        icon: new Icon(
                          Icons.lock,
                          color: Colors.grey,
                        )),
                    validator: (input) {
                      if(input.isEmpty || input.length<2){
                        return strings['incorrectPasswordInput'];
                      }
                    },
                    onSaved: (input) => _password = input,
                  ),
                ),
                Padding(
                  child:RaisedButton(
                    onPressed: (){
                      _signIn(context);
                    },
                    child: Text(strings['signInMessage']),
                  ),
                  padding: EdgeInsets.fromLTRB(10,10,10,0),
                ),
              ],
            ),
        )
      )
    );
  }
  Future<void> _signIn(BuildContext context) async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        LoginPage._user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pop(context);
//        Navigator.push(context, MaterialPageRoute(builder: (context)=> new ChooseImagePage()));
      } catch (exception){
        print(exception.toString());
      }

    }
  }
}
class ChooseImagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChooseImagePageState();
}
class _ChooseImagePageState extends State<ChooseImagePage>{

  File _chosenImage;
  Future _getImageFromGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => {_chosenImage = img});
  }
  Future _getImageFromCamera() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(()=>{_chosenImage = img});
  }
  void _uploadImage(String fileName) async{
    if(_chosenImage!=null){
      StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = ref.putFile(_chosenImage);

      var url =  await(await uploadTask.onComplete).ref.getDownloadURL();
      var data = <String, String>{
        "title": fileName,
        "creationDate": DateTime.now().toIso8601String(),
        "url": url
      };
      final documentReference = Firestore.instance.document('images/'+fileName);
      documentReference.setData(data).whenComplete((){
        print("added doc");
      }).catchError((e)=>print(e));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings['chooseImageMessage'],
          style: Styles.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => { _uploadImage(basename(_chosenImage.path))}
          ),
        ],
      ),
      body: Center(
        child: _chosenImage==null
            ? Text(strings['chooseImageMessage'])
            : Image.file(_chosenImage),

      ),
      floatingActionButton: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "a",
            child: Icon(Icons.photo_album),
            onPressed: _getImageFromGallery,
          ),
          FloatingActionButton(
            heroTag: "b",
            child: Icon(Icons.camera),
            onPressed: _getImageFromCamera,
          )
        ],
      )
    );
  }
}
