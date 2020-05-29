import 'package:flutter/material.dart';
import 'package:noteapp/model/Note.dart';
import 'package:noteapp/view/NoteScreen.dart';

class NoteItem extends StatelessWidget {
  String title = "No title";
  String content = "";
  String created;

  NoteItem({this.title, @required this.content, @required this.created});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0
      ),
      alignment: Alignment.centerLeft,
      child: FlatButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteScreen(title: "My Note", content: "agsag",)));

        },
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(title,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(content,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}