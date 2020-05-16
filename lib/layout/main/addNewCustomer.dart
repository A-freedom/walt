import 'package:flutter/material.dart';
import 'package:untitled2/service/firebaseServices.dart';

// ignore: must_be_immutable
class AddNewCustomer extends StatelessWidget {
  var user, fullname, location;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Customer'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        child: ListView(children: <Widget>[
          TextFormField(
            onChanged: (user) => this.user = user,
            validator: (input) =>
            (input != null || input == '') ? 'this isn\'t vail' : null,
            decoration: InputDecoration(
              hintText: 'USER',
            ),
          ),
          TextFormField(
            onChanged: (fullname) => this.fullname = fullname,
            validator: (input) =>
            (input != null || input == '') ? 'this isn\'t vail' : null,
            decoration: InputDecoration(
              hintText: 'FULL NAME',
            ),
          ),
          TextFormField(
            onChanged: (location) => this.location = location,
            validator: (input) =>
            (input != null || input == '') ? 'this isn\'t vail' : null,
            decoration: InputDecoration(
              hintText: 'LOCATION',
            ),
          ),
        ]),
      ),
      actions: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.done_outline),
          onPressed: () {
            FirebaseServices(context: context, listen: false)
                .addCustomer(data: {
              'user': this.user,
              'fullname': this.fullname,
              'location': this.location,
              'exp': DateTime.now(),
              'total': 0,
            }).then((value) => Navigator.pop(context));
          },
        )
      ],
    );
  }
}
