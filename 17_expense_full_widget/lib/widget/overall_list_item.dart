import 'package:flutter/material.dart';

class OverAllListItem extends StatelessWidget {
  const OverAllListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return ListItem();
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key key}) : super(key: key);

  // Todo : Fix me with custom widget

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]), borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("10/11 Sun"),
                Text("Income : \$0"),
                Text("Expenses : \$800"),
              ],
            ),
            Divider(),
            Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Row(
                    children: [
                      Icon(
                        Icons.airplanemode_active,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 16.0),
                      Text("Travel"),
                      Spacer(),
                      Text("\$1000")
                    ],
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
