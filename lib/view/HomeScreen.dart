import 'dart:io';
import 'package:flutter/material.dart';
import 'package:noteapp/controller/NoteController.dart';
import 'package:noteapp/model/Note.dart';
import 'package:noteapp/view/NoteScreen.dart';
import 'package:noteapp/view/widget/NoteItem.dart';
import 'package:quick_actions/quick_actions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String shortcut = "no action set";

  @override
  void initState() {
    super.initState();

    final QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
    if(shortcutType == 'add_note'){
      print("Ok");
      showDialog(
        context: context,
        builder: (BuildContext context){
            return AlertDialog(
              title: Text("Alert Dialog"),
              content: Text("Dialog Content"),
            );
        }
      );
    }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      // NOTE: This first action icon will only work on iOS.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
        type: 'add_note',
        localizedTitle: 'Tạo ghi chú',
        icon: 'ic_launcher',
      ),
      // NOTE: This second action icon will only work on Android.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
          type: 'note_list',
          localizedTitle: 'Danh sách ghi chú',
          icon: 'AppIcon'
      ),

    ]);

  }


  List<Widget> _noteItems = [];

  _HomeScreenState(){
    _loadNoteList().then((val) => setState(() {
          _noteItems = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700],
        title: Text("Note App",
          style: TextStyle(
            color: Colors.white
          ),
        ),
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
      body: _noteItems.isEmpty ? 
      Center(
        child: Text("Ấn dấu + để tạo ghi chú mới",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54
          ),
        ),
      )
      : Container(
        padding: EdgeInsets.only(
          top: scrHeight * .02
        ),
        child: SafeArea(
          child: ListView(
            children: _noteItems
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent[700],
        child: Icon(Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteScreen(title: "No title", content: "",)));
        },
      ),
    );
  }

  Future<List<Widget>> _loadNoteList() async {
    List<Widget> widgets = [];
    List<Note> notes = await NoteController.loadNotesFromStorage();

    for(var note in notes){
      widgets.add(
        NoteItem(content: note.content, created: note.timeCreated, title: note.title,)
      );
    }
    

    return widgets;
  }
}