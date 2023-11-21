import 'package:flutter/material.dart';
import 'package:app/details.dart';

String? gender;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 23, 129, 222)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Form'),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();

    super.dispose();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Enter your Email address',
                labelText: 'Email',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: "Password",
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please enter some text";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            TextFormField(
              controller: dobController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: 'Enter your date of birth as DD/MM/YYYY',
                labelText: 'Date of Birth',
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Gender:',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Radio(
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    }),
                    const Text("Male"),
                     Radio(
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    }),
                    const Text("Female"),
              ],
            ),
          
            Container(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: ElevatedButton(
                onPressed: (){
                if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('saved')
                                ),
                            );

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Details(
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      dob: dobController.text,
                                      gender: "$gender",
                                    )));
                          }
                 },
                child: const Text("Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
