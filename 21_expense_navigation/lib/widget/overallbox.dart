import 'package:expense_navigation/pages/balance.dart';
import 'package:expense_navigation/pages/expense.dart';
import 'package:expense_navigation/pages/income.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverallBox extends StatelessWidget {
  const OverallBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.simpleCurrency(decimalDigits: 0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatBox(
                  title: "Income",
                  amount: currencyFormat.format(1000),
                  color: Colors.orange,
                  widget: IncomePage(),
                ),
                StatBox(
                  title: "Expenses",
                  amount: currencyFormat.format(1000),
                  color: Colors.green,
                  widget: ExpensePage(),
                ),
                StatBox(
                  title: "Balance",
                  amount: currencyFormat.format(1000),
                  color: Colors.blue,
                  widget: BalancePage(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final String title;
  final String amount;
  final Widget widget;
  final MaterialColor color;
  const StatBox({
    Key key,
    this.title,
    this.amount,
    this.widget,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Text(title),
          SizedBox(
            height: 8.0,
          ),
          Text(
            amount,
            style: TextStyle(
              color: color,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return widget;
          },
        ),
      ),
    );
  }
}
