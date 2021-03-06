import 'package:chatistic/provider/image_upload_provider.dart';
import 'package:chatistic/provider/user_provider.dart';
import 'package:chatistic/resources/auth_methods.dart';
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


  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ImageUploadProvider()),
        ChangeNotifierProvider(create: (_)=>UserProvider()),
      ],
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
          future: _authMethods.getCurrentUser(),
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
