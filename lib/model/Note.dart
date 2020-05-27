import 'package:flutter/material.dart';

class Note{
  String title = "";
  String content = "";
  DateTime timeCreated;
  String username = "";

  Note({this.title, @required this.content, @required this.timeCreated, this.username});
}