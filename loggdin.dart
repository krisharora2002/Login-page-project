import 'package:flutter/material.dart';

class loggedin extends StatefulWidget {
  const loggedin({Key? key}) : super(key: key);

  @override
  State<loggedin> createState() => _loggedinState();
}

class _loggedinState extends State<loggedin> {
  @override
  Widget build(
      context) {
    return Scaffold(
      body: Center(child: Text('Log In Successfull', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
    );
  }
}
