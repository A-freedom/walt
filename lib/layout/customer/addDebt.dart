import 'package:flutter/material.dart';
import 'package:untitled2/service/firebaseServices.dart';

// ignore: must_be_immutable
class AddDebt extends StatefulWidget {
  const AddDebt({
    Key key,
    @required String customerId,
  }) : _customerId = customerId, super(key: key);

  final String _customerId;
  @override
  _AddDebtState createState() => _AddDebtState();
}

class _AddDebtState extends State<AddDebt> {
  String _note;
  String _value;
  int _group = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Debt'),
      content: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height / 2,
        child: ListView(children: <Widget>[
          ListTile(
            title: const Text('for me'),
            leading: Radio(
              value: 1,
              groupValue: _group,
              onChanged: (int value) {
                setState(() {
                  _group = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('on me'),
            leading: Radio(
              value: -1,
              groupValue: _group,
              onChanged: (int value) {
                setState(() {
                  _group = value;
                });
              },
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (value) => this._value = value,
            decoration: InputDecoration(
              hintText: 'VALUE',
            ),
          ),
          TextFormField(
            onChanged: (note) => this._note = note,
            decoration: InputDecoration(
              hintText: 'NOTE',
            ),
          ),
        ]),
      ),
      actions: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.done_outline),
          onPressed: () {
            FirebaseServices(context: context, listen: false)
                .addTranslation(data: {
              'value': this._value * _group,
              'note': this._note,
              'date': DateTime.now(),
            }, customerId:widget._customerId
            ).then((value) => Navigator.pop(context));
          },
        )
      ],
    );
  }
}

