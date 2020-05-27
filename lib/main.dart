import 'package:flutter/material.dart';
import 'package:noteapp/view/HomeScreen.dart';
import 'package:noteapp/view/NoteScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

