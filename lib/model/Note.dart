import 'package:flutter/material.dart';

class Note{
  int id;
  String title = "";
  String content = "";
  String timeCreated;
  String username = "";

  Note({this.title, @required this.content, @required this.timeCreated, this.username, @required this.id});

  Map<String, dynamic> toJson() => {
  'id': id,
  'title': title,
  'content': content,
  'username': username,
  'created': timeCreated
  };

  Note.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      content = json['content'],
      username = json['username'],
      timeCreated = json['created'];
}