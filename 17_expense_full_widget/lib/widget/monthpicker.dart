import 'package:flutter/material.dart';

class MonthMenu extends StatelessWidget {
  const MonthMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Oct"),
          Text(" "),
          Text("2020"),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
