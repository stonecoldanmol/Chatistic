import 'dart:js_util';

import 'package:chatistic/models/call.dart';
import 'package:chatistic/resources/call_methods.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final Call call;

  CallScreen({@required this.call,});
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallMethods callMethods = CallMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(
              'Call has been made',
          ),
          MaterialButton(
            color: Colors.red,
            child: Icon(
              Icons.call_end,
              //color: Colors.white,
            ),
            onPressed: () async => await callMethods.endCall(call: widget.call),
          ),
        ],
      ),
    );
  }
}
