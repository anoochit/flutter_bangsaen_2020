import 'package:flutter/material.dart';

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
        primaryColor: Colors.white,
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
  bool switchState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            RaisedButton(child: Text("Raised Button"), onPressed: () {}),
            FlatButton(child: Text("Flat Button"), onPressed: () {}),
            MaterialButton(child: Text("Material Button"), onPressed: () {}),
            OutlineButton(child: Text("Outline Button"), onPressed: () {}),
            TextButton(child: Text("Text Button"), onPressed: () {}),
            ElevatedButton(child: Text("Elevated Button"), onPressed: () {}),
            Switch(
                value: switchState,
                onChanged: (value) {
                  setState(() {
                    switchState = value;
                  });
                })
          ],
        ),
      )),
    );
  }
}
