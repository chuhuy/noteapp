
import 'package:flutter/material.dart';

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
    widget.title = "No title";
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
          child: Icon (Icons.arrow_back,
          size: 35,
          color:Colors.yellow)
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {

              }, 
              child: Icon(Icons.save_alt,
              color: Colors.yellow,
              size:35) )
          ],
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(   
              padding: EdgeInsets.symmetric(
                horizontal: 15
              ),
              color: Colors.grey[300],
              width: scrWidth,
              child: TextField(
                controller: contentController,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
                style: TextStyle(
                  fontSize:30 ,
                  color: Colors.black
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
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