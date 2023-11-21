import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int i) {
        return Card(
//                    elevation: 10.0,

          child: ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            title: const Text(
              "SAMPLE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text("Sample message"),
            leading: CircleAvatar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.988),
            child: Image.network('https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ),
            trailing: Text(
                "${DateTime.now().hour}" + ":" + "${DateTime.now().second}"),
          ),
        );
      },
    );
  }
}
