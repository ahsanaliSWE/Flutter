import 'package:flutter/material.dart';
import 'package:form/details.dart';


List<String> list = <String>['None', 'Male', 'Female'];
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    dobController.dispose();

    super.dispose();
  }

  String dropdownValue = list.first;

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
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your Name',
                  labelText: 'Name',
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
             ),
            
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
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);

                if (!emailValid) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),

            

            TextFormField(
              controller: passwordController,
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
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(),
                  underline: Container(
                    height: 2,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            CheckboxListTile(
              title: const Text("Agree to Terms and Conditions"),
              value: isChecked,
              checkColor: Colors.white,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: ElevatedButton(
                onPressed: isChecked
                    ? () {
                        if (isChecked == true) {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('saved')),
                            );

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Details(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      dob: dobController.text,
                                      gender: dropdownValue,
                                    )));
                          }
                        }
                      }
                    : null,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
