import 'package:expense_navigation/pages/additem.dart';
import 'package:expense_navigation/pages/balance.dart';
import 'package:expense_navigation/pages/expense.dart';
import 'package:expense_navigation/pages/income.dart';
import 'package:expense_navigation/pages/profile.dart';
import 'package:expense_navigation/pages/summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bottom navigation index
  int _currentIndex = 0;

  // menu icon
  List<IconData> _menuIcon = [
    Icons.dashboard,
    Icons.local_dining,
    Icons.local_atm,
    Icons.local_activity,
    Icons.exit_to_app
  ];

  // list text menu
  List<String> _menuText = ["Dashboard", "Expenses", "Income", "Balance", "Sign Out"];

  // list bottom menu text
  List<String> _bottomMenuText = ["Dashboard", "Expenses", "Income", "Balance", "Account"];

  // list bottom menu icon
  List<IconData> _bottomMenuIcon = [
    Icons.dashboard,
    Icons.local_dining,
    Icons.local_atm,
    Icons.local_activity,
    Icons.account_circle
  ];

  // list page title
  List<String> _pageTitle = ["Money Manager", "Expenses", "Income", "Balance", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle[_currentIndex]),
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          SummaryPage(),
          ExpensePage(),
          IncomePage(),
          BalancePage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: (_currentIndex == 0)
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AddItemPage();
                    },
                  ),
                );
              },
            )
          : Container(),
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
          for (int i = 0; i < 5; i++)
            BottomNavigationBarItem(icon: Icon(_bottomMenuIcon[i]), label: _bottomMenuText[i]),
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
