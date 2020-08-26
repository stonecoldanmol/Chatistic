import 'dart:html';

import 'package:chatistic/models/call.dart';
import 'package:flutter/material.dart';

class PickupScreen extends StatelessWidget {

  final Call call;

  PickupScreen({@required this.call,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Incoming...',
              style: TextStyle(
                    fontSize: 30,
              ),
            ),
            SizedBox(height: 50,),
            Image.network(
              call.callerPic,
              height: 150,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}
