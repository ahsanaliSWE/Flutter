import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      home: DebugListScreen(),
    );
  }
}

class DebugListScreen extends StatefulWidget {
  const DebugListScreen({Key? key}) : super(key: key); // Added 'Key?' to the constructor

  @override
  DebugListScreenState createState() => DebugListScreenState();
}

class DebugListScreenState extends State<DebugListScreen> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  void addItem() {
    int nextItemNumber = items.length + 1; // Calculate the next item number
    items.add('Item $nextItemNumber'); // Add the item with the calculated number
    setState(() {}); 
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index); // Remove the item at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug List Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'List Items',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      // Show a SnackBar when an item is tapped
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(items[index])),
                      );
                    },
                    title: Text(items[index]),
                    trailing: IconButton( // Changed from Icon to IconButton
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        removeItem(index);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addItem();
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
