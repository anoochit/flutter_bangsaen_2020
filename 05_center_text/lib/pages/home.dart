import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text("Center Text"),
          ),
        ),
      ),
    );
  }
}
