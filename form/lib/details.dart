import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  String name, email, password, phone, dob,gender;

  Details({super.key, required this.name, required this.email, required this.password, required this.phone, required this.dob,required this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        ),
      body: Center(
          child:Column(
            children:[
          Text('Name: $name'),    
          Text('Email: $email'),
          Text('Password: $password'),
          Text('Phone: $phone'),
          Text('DOB: $dob'),
          Text('Gender: $gender'),
          ]
          ),
        
         

        ),
    );
  }
}
