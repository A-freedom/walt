import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/layout/customer/customerViewer.dart';
import 'package:untitled2/layout/main/main.dart';
import 'package:untitled2/layout/registration/signin/signin.dart';
import 'package:untitled2/service/auth.dart';

import 'layout/registration/signup/signup.dart';
import 'layout/wraper/warper.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Auth().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/wraper',
        routes: {
          '/wraper':(context)=> Wraper() ,
          '/home':(context) => Main(),
          '/customerViewer':(context) => CustomerViewer() ,
          '/signin':(context) => SignIn() ,
          '/signup':(context) => SignUp() ,
        },
      ),
    );
  }
}

