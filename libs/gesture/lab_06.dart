import 'package:flutter/material.dart';

class Lab06 extends StatefulWidget {
  const Lab06({super.key});

  @override
  State<Lab06> createState() => _Lab06State();
}

class _Lab06State extends State<Lab06> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selected = false;
              });
              showModalBottomSheet(
                context: context,
                builder: (context) => const Column(
                  children: [
                    ListTile(
                      title: Center(child: Text("Create")),
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            onLongPress: () {
              setState(() {
                _selected = true;
              });
            },
            child: ListTile(
              selected: _selected,
              selectedTileColor: Colors.amber,
              leading: const Icon(Icons.ads_click_rounded),
              title: const Text("Gestures"),
            ),
          ),
        ],
      ),
    );
  }
}
