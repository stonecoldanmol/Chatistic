import 'package:chatistic/resources/firebase_repository.dart';
import 'package:chatistic/utils/universal_variables.dart';
import 'package:chatistic/utils/utilities.dart';
import 'package:chatistic/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

//global
final FirebaseRepository _repository = FirebaseRepository();


class _ChatListScreenState extends State<ChatListScreen> {


  String currentUserId;
  String initials;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository.getCurrentUser().then((user){
      setState(() {
        currentUserId = user.uid;
        initials=Utils.getInitials(user.displayName);
      });
    });
  }

CustomAppBar customAppBar(BuildContext context){
return CustomAppBar(
  leading: IconButton(
      icon: Icon(
        Icons.notifications,
        color: Colors.white,
      ),
    onPressed: (){

    },
  ),
  title: UserCircle(initials),
);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
    );
  }
  
}

class UserCircle extends StatelessWidget {
  final String text;

  UserCircle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: UniversalVariables.separatorColor,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: UniversalVariables.lightBlueColor,
                fontSize: 13,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 12,
              width: 12,
            ),
          )
        ],
      ),

    );


  }
}
































