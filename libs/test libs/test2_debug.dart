import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DebugListScreen();
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
       //it should add Item with number as previously added
       // for example next item should be 'Item 4'
       items.add('Item number (add number)');
  }

  void removeItem(int index) {
      items.removeAt(index);
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
                    onTap: (){
                      SnackBar(items[index]);
                    }
                    title: Text(items[index]),
                    trailing: Icon(
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
