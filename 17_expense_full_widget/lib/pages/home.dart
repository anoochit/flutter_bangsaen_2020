import 'package:expense_widget/widget/monthpicker.dart';
import 'package:expense_widget/widget/overallbox.dart';
import 'package:expense_widget/widget/overall_list_item.dart';
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
        title: Text("Money Management"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          MonthMenu(),
          SizedBox(height: 16.0),
          OverallBox(),
          SizedBox(height: 16.0),
          Expanded(
            child: OverAllListItem(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
