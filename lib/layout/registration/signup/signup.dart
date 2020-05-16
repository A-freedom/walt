import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/service/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password1 = '';
  String password2 = '';
  String username = '' ;
  GlobalKey<FormState> formKey = new GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: ListView(
          padding: const EdgeInsets.all(50.0),
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(children: <Widget>[
                    TextFormField(
                      onChanged: (username)=>this.username = username,
                      validator: (input) => (input != null || input == '')
                          ? 'this isn\'t vail'
                          : null,
                      decoration: InputDecoration(
                        hintText: 'USER NAME',
                      ),
                    ),
                    TextFormField(
                      onChanged: (email)=>this.email = email,

                      validator: (input) => (input != null || input == '')
                          ? 'this isn\'t vail'
                          : null,
                      decoration: InputDecoration(
                        hintText: 'EMAIL',
                      ),
                    ),
                    TextFormField(
                      onChanged: (password1)=>this.password1 = password1,
                      validator: (input) => (input != null || input == '')
                          ? 'this isn\'t vail'
                          : null,
                      decoration: InputDecoration(
                        hintText: 'ENTER YOUR PASSWORD',
                      ),
                    ),
                    TextFormField(
                      onChanged: (password2)=>this.password2 = password2,
                      validator: (input) => (input != null || input == '')
                          ? 'this isn\'t vail'
                          : null,
                      decoration: InputDecoration(
                        hintText: 'COMFIER YOUR PASSWORD',
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  RaisedButton(
                    onPressed: () {
                      signUp(context);
                    },
                    child: Text('SIGN UP'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text('I had account'),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('help'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
  void signUp(BuildContext context) {
    Auth()
        .signUpWithEmailAndPassword(
        password1: this.password1,
        password2: this.password2,
        email: this.email,
        username:this.username,
        scaffoldKey: scaffoldKey).then((x)=> Navigator.pop(context));
  }
}
