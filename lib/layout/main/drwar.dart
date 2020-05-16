import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goldenWeight = (MediaQuery.of(context).size.width / 1.68);
    var textStyle1 = Theme.of(context).textTheme.title;
    var textStyle2 = Theme.of(context).textTheme.overline;
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(8),
              child: Row(
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
                                  AssetImage('assets/pro.jpeg'),
                                  child: Icon(
                                    Icons.warning,
//                                    color: Colors.amber,
                                    size: (false) ? 50 : 0,
                                  ),
                                  radius: ((MediaQuery.of(context).size.width -
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
                            'NAME',
                            style: textStyle2,
                          ),
                          Text(
                            'Ali Mousa',
                            style: textStyle1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'INDEBTED',
                            style: textStyle2,
                          ),
                          Text('+450', style: textStyle1),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'CONDEMNED',
                            style: textStyle2,
                          ),
                          Text('-10', style: textStyle1),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          ListTile(
            title: Text('profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('inbox'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('statement'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('logout'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
