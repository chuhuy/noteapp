
import 'package:flutter/material.dart';
import 'package:noteapp/controller/NoteController.dart';
import 'package:noteapp/model/Note.dart';
import 'package:noteapp/view/widget/NoteItem.dart';

class NoteScreen extends StatefulWidget {
  String title = "No title";
  String content = "";

  NoteScreen({this.title, this.content});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  TextEditingController contentController = new TextEditingController();


  void initState(){
    super.initState();
    
    contentController.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.title,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: (){
            Navigator.pop(context); 
          }, 
          child: Icon(Icons.cancel,
            color: Colors.yellowAccent[700],
            size: 30,
          )
        ),
          actions: <Widget>[
            FlatButton(
              //Save note to local storage
              onPressed: () {
                Note note = new Note(title: "My new note", content: contentController.text, timeCreated: DateTime.now().toString(), username: "HuyChu");

                NoteController.saveNoteToLocalStorage(note);
              }, 
              child: Icon(Icons.save_alt,
              color: Colors.yellowAccent[700],
              size:35) )
          ],
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(  
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("lib/asset/paper.jpg"),
                  fit: BoxFit.fill
                )
              ), 
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20
              ),
              width: scrWidth,
              child: TextField(
                controller: contentController,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[800]
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Colors.yellowAccent[700],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SafeArea(
              child: Container (
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10
                ),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    const Radius.circular(32),
                  )
                ),
                width: scrWidth-20,
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Container (
                    width: (scrWidth - 20) / 5,
                    child: FlatButton (
                    child: Icon(Icons.restore_from_trash,
                    size: 35, 
                    color: Colors.yellowAccent[700]),
                    onPressed: (){

                    },)
                  ),
                  Container (
                    width: (scrWidth - 20) / 5,
                    child: FlatButton(
                    child: Icon(Icons.check_circle,
                    size: 35,
                    color: Colors.yellowAccent[700]),
                    onPressed: (){

                    },)
                  ),
                  Container(
                    width: (scrWidth - 20) / 5,
                    child: FlatButton(
                    child: Icon(Icons.camera_alt,
                    size:35,
                    color: Colors.yellowAccent[700]),
                    onPressed: (){

                    },)
                  ),
                  Container(
                    width: (scrWidth - 20) / 5,
                    child: FlatButton(
                      child: Icon(Icons.person_pin_circle,
                    size:35,
                    color: Colors.yellowAccent[700]),
                    onPressed: (){

                    },)
                  ),
                  Container(
                    width: (scrWidth - 20) / 5,
                    child: FlatButton(
                      child: Icon(Icons.note,
                    size:35,
                    color: Colors.yellowAccent[700]),
                    onPressed: (){

                    },)
                  )
                  ],)
              ),
            ),
          )
        ],
      )
    );
  }
}