import 'package:chatistic/provider/image_upload_provider.dart';
import 'package:chatistic/resources/firebase_repository.dart';
import 'package:chatistic/screens/home_screen.dart';
import 'package:chatistic/screens/login_screen.dart';
import 'package:chatistic/screens/search_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider<ImageUploadProvider>(
      create: (context)=>ImageUploadProvider(),
      child: MaterialApp(
        title: "Chatistic",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/search_screen':(context) => SearchScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.dark
        ),
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
      ),
    );
  }
}
