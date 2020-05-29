import 'package:flutter/material.dart';
import 'package:noteapp/model/Note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NoteController{
  
  static Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  static Future<void> saveNoteToLocalStorage(Note note) async {
    final SharedPreferences pref = await _pref;
    final numberOfNote = await getNumberOfNotes();
    pref.setString((numberOfNote).toString(), json.encode(note));
    pref.setInt("numberOfNote", (pref.getInt("numberOfNote") ?? 0) + 1);
    print(json.encode(note));
    print(numberOfNote.toString());

  }

  static Future<Note> loadNoteFromStorageWithID(int noteID) async {
    final SharedPreferences pref = await _pref;
    String jsonNote = pref.getString("Instance of 'Future<int>'");
    print(jsonNote);
    Note note = new Note(content: "", timeCreated: "", title: "");
    if(jsonNote != null) note = Note.fromJson(json.decode(jsonNote));
    return note;
  }

  static Future<List<Note>> loadNotesFromStorage() async {
    final SharedPreferences pref = await _pref;
    List<Note> notes = [];
    int numberOfNote = pref.getInt("numberOfNote") ?? 0;
    for(int index = 0; index < numberOfNote; index++){
      //try{
        Note tempNote = await loadNoteFromStorageWithID(index);
        print(tempNote.content);
        notes.add(tempNote);
      //}
      //catch(err){
      //  print(err);
      //  break;
      //}
    }
    return notes;
  } 

  

  static Future<int> getNumberOfNotes() async {
    final SharedPreferences pref = await _pref;
    final int numberOfNote = (pref.getInt("numberOfNote") ?? 0);

    return numberOfNote;
  }

}