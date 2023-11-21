import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Debugging Test',
      home: DebugListScreen(),
    );
  }
}

class DebugListScreen extends StatefulWidget {
  const DebugListScreen({super.key});

  @override
  DebugListScreenState createState() => DebugListScreenState();
}

class DebugListScreenState extends State<DebugListScreen> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  void addItem() {
    setState(() {
      items.add('Item ${items.length + 1}');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
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
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("items[index]")));
                    },
                    title: Text(items[index]),
                    trailing: IconButton(
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
