import 'package:flutter/material.dart';
import 'package:future/future.dart';
import 'package:future/future2.dart';
import 'package:future/stream.dart';


class FandS extends StatefulWidget {
  const FandS({super.key});

  @override
  State<FandS> createState() => _FandSState();
}

class _FandSState extends State<FandS> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Future and Stream"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FutureDemo()),
            );
 
              }, 
              child: const Text("Future 1"),
              ),
              ElevatedButton(
              onPressed: (){
                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const Future2Demo()),
                 );

              },
              child: const Text("Future 2"),
              ),
              ElevatedButton(
              onPressed: (){

                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const StreamDemo()),
                );

              }, 
              child: const Text("Stream"),
              ),

          ],)
      ),
    );
  }
}
