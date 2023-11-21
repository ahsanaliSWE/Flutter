import 'package:flutter/material.dart';
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
      const MyApp({super.key});


    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: "MyApp",
        theme: ThemeData(
           
           primarySwatch: Colors.blue,
          
        ),
         home: HomePage(),
      );
    }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Chat")),
      ),

    );
  }
}
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? chosenvalue;
  final List itemlist = ["Android", "Ios"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: DropdownButton(
          items: itemlist
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {
            setState(() {
              chosenvalue = value! as String;
            });
          },
          value: chosenvalue,
        ),
      ),
    );
  }
}
