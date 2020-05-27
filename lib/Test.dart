import 'model/Note.dart';

class Test{
  List<Note> createTestListNote(){
    List<Note> notes = [];
    for(int i = 0; i < 5; i++){
      String title = "My Note";
      String content = "Lakjgsdfkajsg askgdkasgdfdhthgddgjfdgjddjdhghgfhfhgfhgfhgdhgd";
      DateTime currentTime = DateTime.now();
      String username = "Huy";
      Note note = new Note(content: content, title: title, timeCreated: currentTime, username: username);
      notes.add(note);
    }

    return notes;
  }

}