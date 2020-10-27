import 'package:expense_navigation/widget/monthpicker.dart';
import 'package:expense_navigation/widget/overall_list_item.dart';
import 'package:expense_navigation/widget/overallbox.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({Key key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
