

import 'dart:async';

import 'package:chatistic/models/call.dart';
import 'package:chatistic/provider/user_provider.dart';
import 'package:chatistic/resources/call_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class CallScreen extends StatefulWidget {
  final Call call;

  CallScreen({@required this.call,});
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallMethods callMethods = CallMethods();

  UserProvider userProvider;
  StreamSubscription callStreamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addPostFrameCallBack();
  }

  addPostFrameCallBack()
  {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);

      callStreamSubscription = callMethods
          .callStream(uid: userProvider.getUser.uid)
          .listen((DocumentSnapshot ds) {
        // defining the logic
        switch (ds.data) {
          case null:
          // snapshot is null which means that call is hanged and documents are deleted
            Navigator.pop(context);
            break;

          default:
            break;
        }
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
