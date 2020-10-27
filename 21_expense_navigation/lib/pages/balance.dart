import 'package:expense_navigation/widget/monthpicker.dart';
import 'package:expense_navigation/widget/summary_chart.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  BalancePage({Key key}) : super(key: key);

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        MonthMenu(),
        SizedBox(height: 16.0),
        SummaryChart(title: "Balance"),
        SizedBox(height: 16.0),
        Expanded(
          child: Container(),
        )
      ],
    );
  }
}
