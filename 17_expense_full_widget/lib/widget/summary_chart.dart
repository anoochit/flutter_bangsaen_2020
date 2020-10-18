import 'package:flutter/material.dart';

class SummaryChart extends StatefulWidget {
  SummaryChart({Key key}) : super(key: key);

  @override
  _SummaryChartState createState() => _SummaryChartState();
}

class _SummaryChartState extends State<SummaryChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: 300.0,
      height: 300.0,
      child: Center(child: Text("place pie chart here")),
    );
  }
}
