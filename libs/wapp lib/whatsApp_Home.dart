import 'package:flutter/material.dart';
import 'package:wapp/camera_screen.dart';
import 'package:wapp/chat_screen.dart';
import 'package:wapp/status_screen.dart';
import 'package:wapp/call_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with 
    SingleTickerProviderStateMixin{
     late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        actions: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child:PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context) {
                  return [
                    // In this case, we need 5 popupmenuItems one for each option.
                    const PopupMenuItem(child: Text('New Group')),
                    const PopupMenuItem(child: Text('New Broadcast')),
                    const PopupMenuItem(child: Text('Linked Devices')),
                    const PopupMenuItem(child: Text('Starred Messages')),
                    const PopupMenuItem(child: Text('Settings')),
                  ];
                },
              ),
           ),
        ],
        backgroundColor: const Color(0xff128C7E),
        //elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "Chats"),
            Tab(text: "Status"),
            Tab(text: "Calls")
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(),
          const ChatScreen(),
          const StatusScreen(),
          CallScreen(),
        ],
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor:  const Color(0xff25D366),
        child:  const Icon(Icons.message),
        onPressed: () {},
       ),
    );
  }
}
