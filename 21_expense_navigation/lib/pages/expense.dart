import 'package:expense_navigation/widget/monthpicker.dart';
import 'package:expense_navigation/widget/summary_chart.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  ExpensePage({Key key}) : super(key: key);

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        MonthMenu(),
        SizedBox(height: 16.0),
        SummaryChart(title: "Expenses"),
        SizedBox(height: 16.0),
        Expanded(
          child: Container(),
        )
      ],
    );
  }
}
