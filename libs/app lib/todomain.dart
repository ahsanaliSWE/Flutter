import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo.dart';
import 'todoprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return TodoProvider();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: const Color(0xFF1781DE)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Todo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: context.watch<TodoProvider>().todolist.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = context.watch<TodoProvider>().todolist[index];
            return ListTile(
              title: Text(todo.title),
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (bool? value) {
                  context.read<TodoProvider>().toggleIsdone(index);
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  context.read<TodoProvider>().removeTodo(index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog'),
              content: const Text('Add product'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Add');
                    context.read<TodoProvider>().addTodo(
                          ToDo(
                            title: "Todo 1",
                            isDone: false,
                          ),
                        );
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
