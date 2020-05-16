import 'package:flutter/material.dart';

class NewDebt extends StatefulWidget {
  @override
  _NewDebtState createState() => _NewDebtState();
}

class _NewDebtState extends State<NewDebt> {
  @override
  var _group = 1;

  Widget build(BuildContext context) {
    final _formKey = new GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        FlatButton(
          child: Icon(Icons.done_outline),
          onPressed: null,
        ),
      ]),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
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
          MyForm(formKey: _formKey),
        ],
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({
    Key key,
    @required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'value'
            ),

          ),
          TextFormField(
            keyboardType: TextInputType.number,

            decoration: InputDecoration(
                hintText: 'discr'
            ),
          ),
        ]));
  }
}
