import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/modules/customer.dart';

class FirebaseServices {
  final userDb = Firestore.instance;

  var user;

  FirebaseServices({context, listen}) {
    this.user = Provider.of<FirebaseUser>(context,
        listen: listen == null ? true : listen);
  }

  Stream<Customers> customersStream() {
    return userDb
        .collection('users/${user.uid}/customers')
        .snapshots()
        .map((snapshot) => Customers(snapshot));
  }

  Stream<Customer> customerStream(String customerId) {
    return userDb
        .document('users/${user.uid}/customers/$customerId')
        .snapshots()
        .map((snapshot) => Customer(snapshot));
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
