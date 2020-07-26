import 'package:chatistic/resources/firebase_repository.dart';
import 'package:chatistic/screens/home_screen.dart';
import 'package:chatistic/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
 @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  FirebaseRepository _repository =FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chatistic",
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context,AsyncSnapshot<FirebaseUser> snapshot){
            if(snapshot.hasData){
              return HomeScreen();
            }
            else{
              return LoginScreen();
            }
        },
      ),
    );
  }
}
