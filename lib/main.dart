import 'package:flutter/material.dart';

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
  int gender = 0;
  var dropdownValues = ['JEE', 'WPSI', '.NET'] ;

  var selectMenuItem ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text("Registration Form"),
         TextFormField(
           decoration: const InputDecoration(
             border: UnderlineInputBorder(),
             labelText: 'Enter your name',
             icon: Icon(Icons.person),
           ),
         ),

          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Email',
              icon: Icon(Icons.email),
            ),
          ),

          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your phone No.',
              icon: Icon(Icons.phone),
            ),
          ),
          Row(children: const <Widget>[
            Icon(Icons.person),
            Text("   Gender :   ",
                style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 40.0),
          ]),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text(
                      'Male'
                  ),
                  leading: Radio(
                    value: 0,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = 0;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text(
                      'Female'
                  ),
                  leading: Radio(
                    value: 1,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = 1;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),




          DropdownButtonFormField(
              items: dropdownValues.map((String dropdownValue){
                return DropdownMenuItem(
                    value: dropdownValue,
                    child: Text(dropdownValue));
              }).toList(),
              onChanged: (newvalue){
                setState(() => selectMenuItem = newvalue);
              },
              value: selectMenuItem,

              )

        ],
      ),
    );
  }
}



