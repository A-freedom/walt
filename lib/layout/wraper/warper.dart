
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/layout/main/main.dart';
import 'package:untitled2/layout/registration/signin/signin.dart';

class Wraper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    if(user == null) return SignIn();
    return Main();
  }
}
