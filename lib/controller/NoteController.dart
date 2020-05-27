import 'package:noteapp/model/Note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NoteController{
  
  static Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  static Future<void> saveNoteToLocalStorage(Note note) async {
    final SharedPreferences pref = await _pref;
    final numberOfNote = getNumberOfNotes();
    pref.setString((numberOfNote).toString(), json.encode(note));
    pref.setInt("numberOfNote", (pref.getInt("numberOfNote") ?? 0) + 1);
    print(json.encode(note));
    print(pref.getInt("numberOfNote"));

  }

  static Future<Note> loadNoteFromStorageWithID(int noteID) async {
    final SharedPreferences pref = await _pref;
    final Note note = json.decode(pref.getString(noteID.toString()));
    return note;
  }

//  static Future<List<Note>> loadNotesFromStorage() async {
//    
//  } 

  static Future<int> getNumberOfNotes() async {
    final SharedPreferences pref = await _pref;
    final int numberOfNote = (pref.getInt("numberOfNote") ?? 0);

    return numberOfNote;
  }

}