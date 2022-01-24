import 'package:flutter/material.dart';
import 'package:untitled/student.dart';

void main() {
  runApp(const MaterialApp(
    home: RegisteationApp(),
  ));
}

class RegisteationApp extends StatefulWidget {
  const RegisteationApp({Key? key}) : super(key: key);

  @override
  _RegisteationAppState createState() => _RegisteationAppState();
}

class _RegisteationAppState extends State<RegisteationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisteationPage(),
      appBar: AppBar(
        title: Text("Welcome to my App"),
      ),
    );
  }
}

class RegisteationPage extends StatefulWidget {
  const RegisteationPage({Key? key}) : super(key: key);

  @override
  _RegisteationPageState createState() => _RegisteationPageState();
}

class _RegisteationPageState extends State<RegisteationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  var _gender ;
  var dropdownValues = ['JEE', 'WPSI', '.NET'];

  var selectMenuItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text("Registration Form"),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your name',
              icon: Icon(Icons.person),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Email',
              icon: Icon(Icons.email),
            ),
          ),
          TextFormField(
            controller: _mobileController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your phone No.',
              icon: Icon(Icons.phone),
            ),
          ),
          Row(children: const <Widget>[
            Icon(Icons.person),
            Text("   Gender :   ", style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 40.0),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Male'),
                  leading: Radio(
                    value: 0,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = 0;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Female'),
                  leading: Radio(
                    value: 1,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = 1;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address:',
              ),
            ),
          ),


          Row(children: const <Widget>[
            Icon(Icons.list_alt),
            Text("   Cources :   ", style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 40.0),
          ]),

          DropdownButtonFormField(
            items: dropdownValues.map((String dropdownValue) {
              return DropdownMenuItem(
                  value: dropdownValue, child: Text(dropdownValue));
            }).toList(),
            onChanged: (newvalue) {
              setState(() => selectMenuItem = newvalue);
            },
            value: selectMenuItem,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 50.0),
              ElevatedButton(
                  onPressed: () {
                   Student student = Student(
                       name: _nameController.text,
                       email: _emailController.text,
                       mobile: _mobileController.text,
                       gender: _gender,
                       courses: selectMenuItem,
                       address: _addressController.text);
                  },
                  child: const Text("Submit"))
            ],
          )



        ],
      ),
    );
  }
}
