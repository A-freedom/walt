import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class FirebaseServices {
  final userDb = Firestore.instance;

  var user;

  FirebaseServices({context, listen}) {
    this.user = Provider.of<FirebaseUser>(context,
        listen: listen == null ? true : listen);
  }

  Stream<Iterable<DocumentSnapshot>> customersStream() {
    return userDb
        .collection('users/${user.uid}/customers')
        .snapshots()
        .map((snapshot) => snapshot.documents.map((e) => e));
  }

  Stream<DocumentSnapshot> customerStream(String customerId) {
    return userDb
        .document('users/${user.uid}/customers/$customerId')
        .snapshots()
        .map((snapshot) => snapshot);
  }

  // ignore: non_constant_identifier_names

  Future updateUserData({fullname, totalDebts}) async {
    userDb.collection('users').document(user.uid).setData({
      'name': fullname,
      'totalDebts': totalDebts,
    });
  }

  Future addCustomer({data}) {
    var customerDb = userDb.collection('users/${user.uid}/customers');
    return customerDb.add(data);
  }

  Future addTranslation({customerId, dateles}) {
    return userDb
        .collection('users/${user.uid}/customers/$customerId/translations')
        .add(dateles);
  }

  Stream<QuerySnapshot> get userStream {
    return userDb.collection('users').snapshots();
  }


}
