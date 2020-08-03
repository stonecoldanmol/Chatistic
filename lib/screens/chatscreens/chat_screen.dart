import 'package:chatistic/models/user.dart';
import 'package:chatistic/utils/universal_variables.dart';
import 'package:chatistic/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  final User receiver;

  ChatScreen({this.receiver});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
    );
  }

  CustomAppBar customAppBar(context){
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
          widget.receiver.name
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.video_call,
          ),
          onPressed: ()
          {

          },
        ),
        IconButton(
          icon: Icon(
            Icons.phone,
          ),
          onPressed: ()
          {

          },
        ),

      ],
    );

  }
}









