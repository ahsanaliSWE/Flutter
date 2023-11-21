import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(254, 254, 254, 0.996),
              child: Icon(Icons.person_3_rounded),
            ),
            title: Text(
              "My Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Tap to add status update"),
          ),
          Container(
            height: 25,
            color: Colors.black12,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                Text("Recent Updates", textAlign: TextAlign.left),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(0),
//                    height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.996),
                        child: Icon(Icons.person_rounded),
                      ),
                      contentPadding: const EdgeInsets.all(7.0),
                      title: const Text("Hey",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Today ${DateTime.now().hour}" +
                          ":" +
                          "${DateTime.now().minute}" +
                          "pm"),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
