import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            contentPadding: EdgeInsets.all(7.0),
            leading: CircleAvatar(
              child: Image.network('https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.996),
            ),
            title:
                Text("Sample", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("Yesterday, ${DateTime.now().hour}" +
                ":" +
                "${DateTime.now().minute}" +
                "pm"),
            trailing: Icon(
              Icons.call,
              color: const Color.fromRGBO(7, 94, 84, 2),
            ),
          );
        },
      ),
    );
  }
}
