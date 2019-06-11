import 'package:Sandal/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './Styles.dart';
import './colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Authorization.dart';

class CommentPage extends StatelessWidget{

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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: () => {
            if(LoginPage.user==null)
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()))
            else
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCommentPage()))
          }
        )
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
                 document['author'] + ": "+ document['title'],
                 style:Theme.of(context).textTheme.title)
            ,
            Text(
                document['creationDate']
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
        Navigator.push((context), MaterialPageRoute(builder: (context) => _CommentDetailsPage(document['title'],document['body'])))
      },);
  }
}
class _CommentDetailsPage extends StatelessWidget{
  String title;
  String body;

  _CommentDetailsPage(String title, String body){
    this.title=title;
    this.body=body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              title,
              style: Styles.headerTextStyle),
          iconTheme: IconThemeData(
            color: MyColors.appbarIconTheme,
          ),
        ),
        body:
        Container(
          child: Padding(
            padding: EdgeInsets.all(15),
            child:Column(
              children: <Widget>[
                Text(body,
                softWrap: true,
                textAlign: TextAlign.justify,
                style: TextStyle(inherit: true, fontSize: 18)),
              ],
            ),
          )
        )

    );
  }
}
class AddCommentPage extends StatelessWidget{
  static final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  String _author, _title, _message, _priority;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings['addCommentPageTitle'],
           style: Styles.titleTextStyle,),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),
      body: Form(
        key: _formKey2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new TextFormField(
                maxLines: 1,
                validator: (input) {
                  if(input.isEmpty){
                    return strings['emptyInputMessage'];
                  }
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: strings['author'],
                    icon: new Icon(
                      Icons.contact_phone,
                      color: Colors.grey,
                    )),
                onSaved: (input) => _author = input,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new TextFormField(
                maxLines: 1,
                validator: (input) {
                  if(input.isEmpty){
                    return strings['emptyInputMessage'];
                  }
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: strings['title'],
                    icon: new Icon(
                      Icons.title,
                      color: Colors.grey,
                    )),
                onSaved: (input) => _title = input,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new TextFormField(
                maxLines: 1,
                validator: (input) {
                  if(input.isEmpty){
                    return strings['emptyInputMessage'];
                  }
                },
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: strings['priority'],
                    icon: new Icon(
                      Icons.priority_high,
                      color: Colors.grey,
                    )),
                onSaved: (input) => _priority = input,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new TextFormField(
                maxLines: 1,
                validator: (input) {
                  if(input.isEmpty){
                    return strings['emptyInputMessage'];
                  }
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: strings['messageBody'],
                    icon: new Icon(
                      Icons.message,
                      color: Colors.grey,
                    )),
                onSaved: (input) => _message = input,
              ),
            ),
            RaisedButton(
              child: Text(strings['submitButtonText']),
              onPressed: _sendMessage,
            )
          ],
        ),
      )
    );
  }
  void _sendMessage() async {
    final formState = _formKey2.currentState;
    if(formState.validate()){
      formState.save();
      var data = <String, String> {
        "title": _title,
        "creationDate": DateTime.now().toString(),
        "author": _author,
        "priority": _priority,
        "body": _message
      };
      await Firestore.instance.collection('posts').add(data).catchError((e) {
      });

    }
  }


}