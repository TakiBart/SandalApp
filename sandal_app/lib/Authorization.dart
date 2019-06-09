import 'package:Sandal/strings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          strings['signInMessage'],
          style: Style.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),

      ),
      body: Form(
        key: _formKey,
        child: Column(

          children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input.isEmpty || !input.contains('@')){
                    return strings['incorrectEmailInput'];
                  }
                },
                onSaved: (input) { _email = input; },
                decoration: InputDecoration(
                  labelText: 'E-mail'
                ),
              ),
            TextFormField(
              validator: (input) {
                if(input.length < 2){
                  return strings['incorrectPasswordInput'];
                }
              },
              onSaved: (input) { _password = input;},
              decoration: InputDecoration(

                  labelText: strings['password'],
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: (){
                  _signIn(context);
              },
              child: Text(strings['signInMessage']),
            )

          ],
        ),
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new WelcomePage()));
      }
      catch(e){
        LoginPage._user=null;
        print(e.toString());
      }

    }
  }
}
class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings['chooseImageMessage'], //+ LoginPage._user.displayName,
          style: Style.titleTextStyle,
        ),
        iconTheme: IconThemeData(
          color: MyColors.appbarIconTheme,
        ),
      ),
    );
  }

}
