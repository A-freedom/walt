import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled2/layout/main/addNewCustomer.dart';
import 'package:untitled2/layout/main/drwar.dart';
import 'package:untitled2/service/auth.dart';
import 'package:untitled2/service/firebaseServices.dart';


class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: DrawerWidget(),
        body: StreamBuilder<Iterable>(
            stream: FirebaseServices(context: context).customersStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  addAutomaticKeepAlives: false,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  children: snapshot.data.map((e) => ListItem(customerDoc: e,)).toList()
                );
              }
              if (snapshot.hasError) {
                scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(snapshot.error),
                ));
              }
              return Text('loading');
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddNewCustomer();
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                  icon: Icon(
                    Icons.toc,
//                color: Colors.white,
                  )),
              IconButton(
                  onPressed: () => Auth().signOut(),
                  icon: Icon(
                    Icons.more_vert,
//                  color: Colors.white
                  ))
            ],
          ),
        ),
      ),
    );
  }
}



class ListItem extends StatelessWidget {
  DocumentSnapshot customerDoc ;
  ListItem({this.customerDoc});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Card(
        child: ListTile(
          subtitle: Text(customerDoc.data['user'].toString()),
          title: Text(customerDoc.data['fullname'].toString()),
          trailing: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(customerDoc.data['total'].toString()),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person_pin),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/userViewer',arguments: {'customerDoc':customerDoc});
      },
      onLongPress: () {
        Navigator.pushNamed(context, '/userViewer');
      },
    );
  }
}
