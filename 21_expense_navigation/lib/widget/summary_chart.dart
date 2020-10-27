import 'package:flutter/material.dart';

class SummaryChart extends StatefulWidget {
  final String title;

  SummaryChart({Key key, this.title}) : super(key: key);

  @override
  _SummaryChartState createState() => _SummaryChartState(this.title);
}

class _SummaryChartState extends State<SummaryChart> {
  String title;
  _SummaryChartState(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: 300.0,
      height: 300.0,
      child: Center(child: Text("place pie chart for " + this.title + " here")),
    );
  }
}
