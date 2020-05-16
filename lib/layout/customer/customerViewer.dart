import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/service/firebaseServices.dart';

class CustomerViewer extends StatefulWidget {
  @override
  _CustomerViewerState createState() => _CustomerViewerState();
}

class _CustomerViewerState extends State<CustomerViewer> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Map customer = arguments['customer'];
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          padding: const EdgeInsets.only(bottom: 70),
          children: <Widget>[
            Header(),
            Column(
              children: <Widget>[
                Tran(),
                Tran(),
                Tran(),
                Tran(),
                Tran(),
                Tran(),
                Tran(),
                Tran(),
                Tran()
              ],
            )
          ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
//          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/newDebt',
              arguments: {customer: customer});
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Map arguments = ModalRoute.of(context).settings.arguments;
    DocumentSnapshot customerDoc = arguments['customerDoc'];
    String customerId = customerDoc.documentID ;

    final goldenWeight = (MediaQuery.of(context).size.width / 1.68);
    var textStyle1 = Theme.of(context).textTheme.subtitle1;
    var textStyle2 = Theme.of(context).textTheme.overline;
    return Container(
        padding: EdgeInsets.all(8),
        child: StreamBuilder<DocumentSnapshot>(
            stream:
                FirebaseServices(context: context).customerStream(customerId),
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
                                    backgroundImage:
                                        AssetImage(''),
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
                            Text(customer['fullname'].toString(), style: textStyle1),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'EXP',
                              style: textStyle2,
                            ),
                            Text(customer['exp'].toDate().toString(), style: textStyle1),
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

class Tran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 0, 12),
          child: Text('2020/4/3'),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '50',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
          child: Text('refill'),
        ),
        trailing: FlatButton.icon(
          icon: Text(''),
          label: Icon(Icons.delete_outline),
          onPressed: () => null,
        ),
      ),
    );
  }
}
