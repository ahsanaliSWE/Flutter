import 'package:flutter/material.dart';

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
enum Skill { java, kotlin }

class _MyHomePageState extends State<MyHomePage> {
  bool java = false;
  bool kotlin = false;
  Skill? _skill = Skill.java;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
         const Text("Chose Skill"),
          RadioListTile<Skill>(
            title: const Text('Java'),
            value: Skill.java,
            groupValue: _skill,
            onChanged: (Skill? value) {
              setState(() {
                _skill = value;
              });
            },
          ),
          RadioListTile<Skill>(
            title: const Text('kotlin'),
            value: Skill.kotlin,
            groupValue: _skill,
            onChanged: (Skill? value) {
              setState(() {
                _skill = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

