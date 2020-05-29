
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/controller/NoteController.dart';
import 'package:noteapp/model/Note.dart';
import 'package:noteapp/view/widget/SnackBarNotifier.dart';

class NoteScreen extends StatefulWidget {
  String title = "Không tiêu đề";
  String content = "";
  int id = -1;
  NoteScreen({this.title, this.content, @required this.id});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _contentController = new TextEditingController();
  TextEditingController _titleController = new TextEditingController();
  int id;

  void initState(){
    super.initState();
    id = widget.id;
    print(id.toString());
    _contentController.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
                if(_contentController.text == "") SnackBarNotifier.showSnackBar(_scaffoldKey, "Ghi chú chưa có nội dung", Colors.red);
                else
                showDialog(
                  context: context,
                  builder: (BuildContext context) => new CupertinoAlertDialog(
                    title: new Text("Nhập tên ghi chú"),
                    content: Container(
                      margin: EdgeInsets.only(
                        top: 15
                      ),
                      child: CupertinoTextField(
                        controller: _titleController,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    actions: <Widget> [
                      FlatButton( 
                        child: new Text("Xong",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        onPressed: (){
                          Note note = new Note(title: _titleController.text ?? "Không tiêu đề", content: _contentController.text, timeCreated: DateTime.now().toString(), username: "HuyChu", id: id);
                          if(id == -1) NoteController.saveNoteToLocalStorage(note);
                          else NoteController.updateNoteWithID(note, id.toString());

                          Navigator.pop(context);
                        },
                      ),
                      FlatButton( 
                        child: new Text("Huỷ",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      )
                    ])
                );
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
                controller: _contentController,
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