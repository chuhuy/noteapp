import 'package:flutter/material.dart';
import 'package:noteapp/view/NoteScreen.dart';

class NoteItem extends StatelessWidget {
  String title = "No title";
  String content = "";
  String created;
  int id = -1;

  NoteItem({this.title, @required this.content, @required this.created, @required this.id});

  @override
  Widget build(BuildContext context) {
    DateTime timeCreated = DateTime.parse(created);
    double scrWidth = MediaQuery.of(context).size.width;
    String hhmm = ((timeCreated.hour > 10) ? timeCreated.hour.toString() : "0${timeCreated.hour.toString()}") + ':'
                + ((timeCreated.minute > 10) ? timeCreated.minute.toString() : "0${timeCreated.minute.toString()}");
    String ddmmyyyy = ((timeCreated.day > 10) ? timeCreated.day.toString() : "0${timeCreated.day.toString()}") + '/'
                    + ((timeCreated.month > 10) ? timeCreated.month.toString() : "0${timeCreated.month.toString()}") + '/'
                    + timeCreated.year.toString();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          const Radius.circular(5)
        ),
        color: Colors.white
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0
      ),
      margin: EdgeInsets.only(
        bottom: 3.0
      ),
      child: FlatButton(
        onPressed: (){
          print(id.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteScreen(title: title, content: content, id: id,)));
        },
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: scrWidth - 120,
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
                    child: Text(ddmmyyyy),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: scrWidth - 120,
                  alignment: Alignment.centerLeft,
                  child: Text(content,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                Container(
                  child: Text(hhmm),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}