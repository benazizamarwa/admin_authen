import 'package:admin_auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
 @override
 _MyappState createState() => _MyappState();
}

class _MyappState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: unnecessary_const
      home:LoginScreen()
      
    );
  }
}



