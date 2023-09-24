import 'package:flutter/material.dart';
import 'package:untitled/HomeScreen.dart';
import 'package:untitled/Login.dart';

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Xo",
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        Login.routeName :(_)=>Login()
      },
      initialRoute: Login.routeName,
    );
  }
}
