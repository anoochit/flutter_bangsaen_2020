import 'package:expense_navigation/widget/monthpicker.dart';
import 'package:expense_navigation/widget/summary_chart.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  IncomePage({Key key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income"),
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
