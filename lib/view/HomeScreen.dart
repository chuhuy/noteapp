import 'package:flutter/material.dart';
import 'package:noteapp/controller/NoteController.dart';
import 'package:noteapp/model/Note.dart';
import 'package:noteapp/view/NoteScreen.dart';
import 'package:noteapp/view/widget/NoteItem.dart';
import 'package:noteapp/view/widget/QuickAction.dart';
import 'package:quick_actions/quick_actions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String shortcut = "no action set";
  final QuickActions quickActions = QuickActions();


  @override
  void initState() {
    super.initState();    
    QuickAction.handleQuickAction(quickActions, context);
    QuickAction.initQuickAction(quickActions);
  }


  List<Widget> _noteItems = [];

  _HomeScreenState(){
    _loadNoteList().then((val) => setState(() {
          _noteItems = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
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
          child: Icon(Icons.refresh,
            color: Colors.white,
            size: scrWidth * .07,
          ),
          onPressed: (){
            setState(() {
              _loadNoteList().then((val) => setState(() {
                    _noteItems = val;
                  }));
            });
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteScreen(title: "Không tiêu đề", content: "", id: -1,)));
        },
      ),
    );
  }

  Future<List<Widget>> _loadNoteList() async {
    List<Widget> widgets = [];
    List<Note> notes = await NoteController.loadNotesFromStorage();

    for(var note in notes){
      widgets.add(
        NoteItem(content: note.content, created: note.timeCreated, title: note.title, id: note.id,)
      );
    }
    

    return widgets;
  }
}