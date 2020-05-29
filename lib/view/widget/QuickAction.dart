
import 'package:flutter/material.dart';
import 'package:noteapp/view/NoteScreen.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickAction{

  static void initQuickAction(QuickActions quickActions){
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'add_note',
        localizedTitle: 'Tạo ghi chú',
        icon: 'ic_launcher',
      ),
      const ShortcutItem(
          type: 'note_list',
          localizedTitle: 'Danh sách ghi chú',
          icon: 'home'
      ),
    ]);
  }

  static void handleQuickAction(QuickActions quickActions, BuildContext context){
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'add_note') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoteScreen(title: "Không tiêu đề", content: "", id: -1,)));
      } else if(shortcutType == 'note_list') {
        print('Show the help dialog!');
      }
    });
  }
}