import 'package:flutter/material.dart';
import 'package:untitled2/service/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      onChanged: (email) {
                        this.email = email;
                      },
//                        validator: (input) => (input != null || input == '')
//                            ? 'this isn\'t vail'
//                            : null,
                      decoration: InputDecoration(
                        hintText: 'EMAIL',
                      ),
                    ),
                    TextFormField(
                      onChanged: (password) {
                        this.password = password;
                      },
//                        validator: (input) => (input != null || input == '')
//                            ? 'this isn\'t vail'
//                            : null,
                      decoration: InputDecoration(
                        hintText: 'PASSWORD',
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                RaisedButton(
                  onPressed: () {
                    signIn(context);
                  },
                  child: Text('SIGN IN'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text('forget my password'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text('register'),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) {
    Auth()
        .signInWithEmailAndPassword(
            password: this.password,
            email: this.email,
            scaffoldKey: scaffoldKey);
  }
}
