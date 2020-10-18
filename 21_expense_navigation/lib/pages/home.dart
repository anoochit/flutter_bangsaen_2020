import 'package:expense_navigation/widget/monthpicker.dart';
import 'package:expense_navigation/widget/overall_list_item.dart';
import 'package:expense_navigation/widget/overallbox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bottom navigation index
  int _currentIndex = 0;

  List<IconData> _menuIcon = [
    Icons.dashboard,
    Icons.local_dining,
    Icons.local_atm,
    Icons.local_activity,
    Icons.exit_to_app
  ];

  List<String> _menuText = ["Dashboard", "Expenses", "Income", "Balance", "Sign Out"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Management"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            MonthMenu(),
            SizedBox(height: 16.0),
            OverallBox(),
            SizedBox(height: 8.0),
            OverAllListItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.local_dining), label: "Expenses"),
          BottomNavigationBarItem(icon: Icon(Icons.local_atm), label: "Income"),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: "Balance"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account")
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 64.0,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Darth Dart",
              style: TextStyle(fontSize: 22.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(_menuIcon[index]),
                    title: Text(_menuText[index]),
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
