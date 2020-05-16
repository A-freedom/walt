import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/layout/customer/addDebt.dart';
import 'package:untitled2/service/firebaseServices.dart';

class CustomerViewer extends StatefulWidget {
  @override
  _CustomerViewerState createState() => _CustomerViewerState();
}

class _CustomerViewerState extends State<CustomerViewer> {
  @override
  Widget build(BuildContext context) {
    Map _arguments = ModalRoute.of(context).settings.arguments;
    DocumentSnapshot _customerDoc = _arguments['_customerDoc'];
    String _customerId = _customerDoc.documentID;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          padding: const EdgeInsets.only(bottom: 70),
          children: <Widget>[
            Header(),
            StreamBuilder<Iterable>(
              stream: FirebaseServices(context: context)
                  .streamIterable(path: '/customers/$_customerId/translations'),
              builder:(context, snapshot) {
                if(snapshot.hasData){
                  return Column(
                    children: snapshot.data.map((e) {
                      return Card(
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 12, 0, 12),
                            child: Text(e.data['date'].toDate().toString()),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.data['value'].toString(),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
                            child: Text(e.data['note'].toString()),
                          ),
                          trailing: FlatButton.icon(
                            icon: Text(''),
                            label: Icon(Icons.delete_outline),
                            onPressed: () => null,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }else if (snapshot.hasError) {
                  print('error');
                }
                return Text('loading');
              },
            )
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
//          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddDebt(customerId: _customerId);
              });
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map _arguments = ModalRoute.of(context).settings.arguments;
    DocumentSnapshot _customerDoc = _arguments['_customerDoc'];
    String customerId = _customerDoc.documentID;

    final goldenWeight = (MediaQuery.of(context).size.width / 1.68);
    var textStyle1 = Theme.of(context).textTheme.headline5;
    var textStyle2 = Theme.of(context).textTheme.subtitle2;
    return Container(
        padding: EdgeInsets.all(8),
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseServices(context: context)
                .streamDocumentSnapshot(path: '/customers/$customerId'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map customer = snapshot.data.data;
                return Row(
                  children: <Widget>[
                    Expanded(
                      flex: 100,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        height: goldenWeight,
                        child: Center(
                            child: Hero(
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1589540151477-d64752a73c35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80'),
                                    child: Icon(
                                      Icons.warning,
//                                    color: Colors.amber,
                                      size: (false) ? 50 : 0,
                                    ),
                                    radius:
                                        ((MediaQuery.of(context).size.width -
                                                    (goldenWeight)) /
                                                2) -
                                            9),
                                tag: '')),
                      ),
                    ),
                    Expanded(
                      flex: 168,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: goldenWeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'USER',
                              style: textStyle2,
                            ),
                            Text(
                              customer['user'].toString(),
                              style: textStyle1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'NAME',
                              style: textStyle2,
                            ),
                            Text(customer['fullname'].toString(),
                                style: textStyle1),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'EXP',
                              style: textStyle2,
                            ),
                            Text(customer['exp'].toDate().toString(),
                                style: textStyle1),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                print('error');
              }
              return Text('loading');
            }));
  }
}

