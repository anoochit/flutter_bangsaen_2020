import 'package:expense_widget/widget/monthpicker.dart';
import 'package:expense_widget/widget/summary_chart.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  ExpensePage({Key key}) : super(key: key);

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          MonthMenu(),
          SizedBox(height: 16.0),
          SummaryChart(),
          SizedBox(height: 16.0),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
