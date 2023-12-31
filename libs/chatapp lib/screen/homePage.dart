import 'package:flutter/material.dart';
import 'package:chatapp/screen/chatPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ChatPage(),
       bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label :  "Chats",
         ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label : "Channels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label : "Profile",
          ),
        ],
        
      ),
    );
  }
}
