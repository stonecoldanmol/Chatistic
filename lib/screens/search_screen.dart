import 'package:chatistic/models/user.dart';
import 'package:chatistic/resources/firebase_repository.dart';
import 'package:chatistic/utils/universal_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  FirebaseRepository _repository=FirebaseRepository();


  List<User> userList;
  String query="";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _repository.getCurrentUser().then((FirebaseUser user){

      _repository.fetchAllUsers(user).then((List<User> list){
        setState(() {
          userList=list;
        });
      });

    });
  }

searchAppBar(BuildContext context)
{
    return GradientAppBar(
      backgroundColorStart: UniversalVariables.gradientColorStart,
      backgroundColorEnd: UniversalVariables.gradientColorEnd,
      leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: ()=> Navigator.pop(context),
      ),
      elevation: 0,
      bottom: PreferredSize(

        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Padding(
            padding: EdgeInsets.only(left: 20),
           child: TextField(
             controller: searchController,
             onChanged: (val){
               setState(() {
                 query=val;
               });
             },
             cursorColor: UniversalVariables.blackColor,
             autofocus: true,
             style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.white,
               fontSize: 35,
             ),
             decoration: InputDecoration(
               suffixIcon: IconButton(
                 icon: Icon(Icons.close,color: Colors.white,),
                 onPressed: (){
                   //searchController.clear();
                   WidgetsBinding.instance.addPostFrameCallback((_) => searchController.clear());
                 },
               ),
               border: InputBorder.none,
               hintText: 'Search',
               hintStyle: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 35,
                 color: Color(0x88ffffff),
               ),
             ),
           ),
        ),

      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: searchAppBar(context),
      body: Container(),
    );
  }
}















