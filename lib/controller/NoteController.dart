import 'package:noteapp/model/Note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NoteController{
  
  static Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  static Future<void> saveNoteToLocalStorage(Note note) async {
    final SharedPreferences pref = await _pref;
    final numberOfNote = await getNumberOfNotes();
    note.id = numberOfNote;
    pref.setString((numberOfNote).toString(), json.encode(note));
    pref.setInt("numberOfNote", (pref.getInt("numberOfNote") ?? 0) + 1);
    print(json.encode(note));
    print(numberOfNote.toString());
  }

  static Future<void> updateNoteWithID(Note note, String noteID) async{
    final SharedPreferences pref = await _pref;
    pref.setString(noteID, json.encode(note));
    print("Updated");
  }

  static Future<Note> loadNoteFromStorageWithID(String noteID) async {
    final SharedPreferences pref = await _pref;
    String jsonNote = pref.getString(noteID);
    print(jsonNote);
    Note note = new Note(content: "", timeCreated: "", title: "", id: -1);
    if(jsonNote != null) note = Note.fromJson(json.decode(jsonNote));
    return note;
  }

  static Future<List<Note>> loadNotesFromStorage() async {
    final SharedPreferences pref = await _pref;
    List<Note> notes = [];
    Set<String> keys = pref.getKeys();
    for(var key in keys){
      if(key == 'numberOfNote') continue;
      print(key);
      Note tempNote = await loadNoteFromStorageWithID(key);
      print(tempNote.content);
      notes.add(tempNote);
    }
    return notes;
  } 

  static Future<void> deleteNoteWithID(int noteID) async { 
    final SharedPreferences pref = await _pref;
    pref.remove(noteID.toString());
  }
  

  static Future<int> getNumberOfNotes() async {
    final SharedPreferences pref = await _pref;
    final int numberOfNote = (pref.getInt("numberOfNote") ?? 0);

    return numberOfNote;
  }

}