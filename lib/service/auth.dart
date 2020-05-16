import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  Future signOut() {
    return _auth.signOut();
  }

  // ignore: missing_return
  Future signInWithEmailAndPassword({password, email, scaffoldKey}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      exError(error: e, scaffoldKey: scaffoldKey);
      return e;
    }
  }

  Future signUpWithEmailAndPassword(
      {password1, password2, email, scaffoldKey, username}) async {
    if (password1.toString() == password2.toString()) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password1).then((result) =>
            result.user.sendEmailVerification()
        );
        await signInWithEmailAndPassword(password: password1, email: email);
      } catch (e) {
        exError(error: e, scaffoldKey: scaffoldKey);
        return e;
      }
    }
  }

  void exError({error, scaffoldKey}) {
    scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(error.message)));
  }
}
