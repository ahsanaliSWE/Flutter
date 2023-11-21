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

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 20;
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
      const  Row(
        children:[ 
           SizedBox(
             width: 350,
             height: 200,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'UserName',
                ),
              ),
            ),
          
        ],
      ),
         Row(
         children: [
          Switch(
               // This bool value toggles the switch.
               value: light,
               activeColor: Colors.red,
               onChanged: (bool value) {
               // This is called when the user toggles the switch.
                 setState(() {
                     light = value;
                  });
                },
          ),
        ],
       ),
        Row(
        children: [
          Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
               onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    }
                  );
                },
          ),
         
          ],),
      ],),
    );
  }
}
