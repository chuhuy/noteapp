import 'package:flutter/material.dart';

class Note{
  String title = "";
  String content = "";
  String timeCreated;
  String username = "";

  Note({this.title, @required this.content, @required this.timeCreated, this.username});

  Map<String, dynamic> toJson() => {
  'title': title,
  'content': content,
  'username': username,
  'created': timeCreated
  };

  Note.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      content = json['content'],
      username = json['username'],
      timeCreated = json['created'];
}