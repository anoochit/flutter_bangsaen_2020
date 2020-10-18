import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _textController = new TextEditingController();

  var _currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Manager",
        ),
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              new Theme(
                data: new ThemeData(
                  primaryColor: Colors.black,
                  primaryColorDark: Colors.black,
                ),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Text",
                    hintText: "Enter some text",
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    // do something while input change
                    setState(() {
                      _currentText = value;
                    });
                  },
                  validator: (value) {
                    // if empty show error
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      log("ok your text is not empty");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text("Text : " + _currentText),
            ],
          ),
        ),
      ),
    );
  }
}
