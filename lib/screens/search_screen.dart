import 'package:chatistic/models/user.dart';
import 'package:chatistic/resources/firebase_repository.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Container();
  }
}
