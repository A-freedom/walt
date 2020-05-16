import 'package:cloud_firestore/cloud_firestore.dart';

class Customers {
  var list = [];

  Customers(QuerySnapshot snapshots) {
    snapshots.documents.forEach((doc) => list.add(Customer(doc)));
  }
}

class Customer {
  String fullname;

  String user;

  String address;

  String exp;

  String total;

  String customerId;

  Customer(doc) {
    this.fullname = doc['fullname'].toString();
    this.user = doc['user'].toString();
    this.address = doc['location'].toString();
    this.exp = doc['exp'].toDate().toString() ;
    this.total = doc['total'].toString();
    this.customerId = doc.documentID.toString();
  }
}
