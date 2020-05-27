import 'package:flutter/material.dart';
import 'package:noteapp/Test.dart';
import 'package:noteapp/model/Note.dart';
import 'package:noteapp/view/NoteScreen.dart';
import 'package:noteapp/view/widget/NoteItem.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Test test = new Test();

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    List<Note> notes = test.createTestListNote();

    return Scaffold(
      appBar: AppBar(
        title: Text("Note App"),
        centerTitle: true,
        leading: FlatButton(
          child: Icon(Icons.account_circle,
            color: Colors.white,
            size: scrWidth * .07,
          ),
          onPressed: (){

          },
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.menu,
              size: scrWidth * .07,
              color: Colors.white,
            ),
            onPressed: (){

            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: scrHeight * .02
        ),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              NoteItem(content: "asfjkag", created: DateTime.now(), title: "My Note",),
              NoteItem(content: "asfjkag", created: DateTime.now(), title: "My Second Note",),

            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteScreen(title: "", content: "",)));
        },
      ),
    );
  }
}