import 'package:flutter/material.dart';
import 'package:chatapp/models/chatUserModel.dart';
import 'package:chatapp/models/ConversationList.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "https://placekitten.com/250/250", time: "Now", image: ''),
    ChatUsers(name: "Glady's Murphy",  messageText: "That's Great", imageURL: "https://placekitten.com/250/250", time: "Yesterday", image: ''),
    ChatUsers(name: "Jorge Henry",  messageText: "Hey where are you?", imageURL: "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250", time: "31 Mar", image: ''),
    ChatUsers(name: "Philip Fox",  messageText: "Busy! Call me in 20 mins", imageURL: "assets/images/phillip.jpeg", time: "28 Mar", image: ''),
    ChatUsers(name: "Debra Hawkins",  messageText: "Thankyou, It's awesome", imageURL: "assets/images/debra.jpeg", time: "23 Mar", image: ''),
    ChatUsers(name: "Jacob Pena",  messageText: "will update you in evening", imageURL: "https://robohash.org/mail@ashallendesign.co.uk", time: "17 Mar", image: ''),
    ChatUsers(name: "Andrey Jones",  messageText: "Can you please share the file?", imageURL: "assets/images/andry.png", time: "24 Feb", image: ''),
    ChatUsers(name: "John Wick",  messageText: "How are you?", imageURL: "assets/images/johnwick.jpg", time: "18 Feb", image: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(child: Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
              decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
              color: Colors.grey.shade100
           )
        ),
      ),
   ),
  ),
),
            SafeArea(child: ListView.builder(
            itemCount: chatUsers.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return ConversationList(
            name: chatUsers[index].name,
            messageText: chatUsers[index].messageText,
            imageUrl: chatUsers[index].imageURL,
            time: chatUsers[index].time,
            isMessageRead: (index == 0 || index == 3)?true:false,
          );
        },
      ),
    ),
       ],
          
        ),
       ),
    );
  }
}



