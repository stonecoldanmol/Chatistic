import 'package:chatistic/models/user.dart';
import 'package:chatistic/utils/universal_variables.dart';
import 'package:chatistic/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  final User receiver;

  ChatScreen({this.receiver});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  TextEditingController textFieldController =TextEditingController();

  bool isWriting = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
      body: Column(
        children: <Widget>[
          chatControls(),
        ],
      ),
    );
  }


  Widget chatControls(){


    setWritingTo(bool val){
      setState(() {
        isWriting=val;
      });
    }


    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: UniversalVariables.fabGradient,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: TextField(
                controller: textFieldController,
              style: TextStyle(
                color: Colors.white,
              ),
              onChanged: (val){

                (val.length>0 && val.trim()!="")? setWritingTo(true) : setWritingTo(false);

              },
              decoration: InputDecoration(
                hintText: 'Type a Message',
                hintStyle: TextStyle(
                  color: UniversalVariables.greyColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                  borderSide: BorderSide.none
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                filled: true,
                fillColor: UniversalVariables.separatorColor,
                suffixIcon: GestureDetector(
                  onTap: (){

                  },
                  child: Icon(Icons.face),
                )
              ),
            ),
          ),
          isWriting?
          Container()
              :Padding(
              padding:EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.record_voice_over),
          ),
          isWriting?
          Container()
              : Icon(Icons.camera_alt),
          isWriting ? Container(
              margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              gradient: UniversalVariables.fabGradient,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.send,
              size: 15,
              ),
              onPressed: () => {},
            ),
          ): Container()
        ],
      ),
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









