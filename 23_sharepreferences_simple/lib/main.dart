import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        primarySwatch: Colors.blue,
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
  String name = "";

  saveData(String name) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setString("name", name);
  }

  Future<String> loadData() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    String result = pf.getString("name");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Share Preferences")),
      body: Container(
          child: Column(
        children: [
          Text("My name : " + name),
          RaisedButton(
              child: Text("Save data -> Darth Dart"),
              onPressed: () {
                // save to preference
                saveData("Darth Dart");
              }),
          RaisedButton(
              child: Text("Save data -> Darth Moor"),
              onPressed: () {
                // save to preference
                saveData("Darth Moor");
              }),
          RaisedButton(
              child: Text("Show data"),
              onPressed: () {
                // load to preference
                loadData().then((value) {
                  log(value);
                  setState(() {
                    name = value;
                  });
                });
              }),
        ],
      )),
    );
  }
}
