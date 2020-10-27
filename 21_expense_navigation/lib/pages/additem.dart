import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  AddItemPage({Key key}) : super(key: key);

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  int _currentTabIndex = 0;
  int _currentOption = null;

  List<String> _expenseGridText = [
    "Food",
    "View",
    "Transform",
    "Home",
    "Car",
    "Entertainment",
    "Shopping",
    "Clothing",
    "Insurance",
    "Tax",
    "Telephone",
    "Cigarette",
    "Health",
    "Sport",
    "Baby",
    "Pet"
  ];

  List<String> _incomeGridText = [
    "Salary",
    "Awards",
    "Grant",
    "Sale",
    "Rental",
    "Refunds",
    "Coupons",
    "Lottery",
    "Divident",
    "Investment",
    "Others"
  ];

  var _colorOption = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
  ];

  bool _showBottomSheet = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Item"),
        ),
        body: Stack(
          children: [
            // tap and option
            Column(
              children: [
                // tab
                _buildTab(),
                // divider
                Divider(),
                // option grid
                (_currentTabIndex == 0)
                    ? _buildOptionGrid(items: _expenseGridText)
                    : _buildOptionGrid(items: _incomeGridText),
              ],
            ),
            // bottom sheet use willpop to control visibility
            (_showBottomSheet)
                ? Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      child: Text("super"),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_showBottomSheet == true) {
      setState(() {
        _showBottomSheet = false;
      });
      return false;
    } else {
      setState(() {
        _showBottomSheet = true;
      });
      return true;
    }
  }

  Widget _buildTab() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Expenses",
              style: TextStyle(
                fontSize: 16,
                fontWeight: (_currentTabIndex == 0) ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          onTap: () {
            setState(() {
              _currentTabIndex = 0;
            });
          },
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Income",
              style: TextStyle(
                fontSize: 16,
                fontWeight: (_currentTabIndex == 0) ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
          onTap: () {
            setState(() {
              _currentTabIndex = 1;
            });
          },
        ),
      ],
    );
  }

  Widget _buildOptionGrid({List<String> items}) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 4,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < items.length; i++)
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundColor:
                            (_currentOption == i) ? _colorOption[i % 4] : Colors.grey[200],
                        radius: 30,
                        child: Icon(
                          Icons.shopping_basket,
                          color: (_currentOption == i) ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(items[i]),
                    )
                  ],
                ),
              ),
              onTap: () {
                // on press
                setState(() {
                  _currentOption = i;
                  _showBottomSheet = true;
                });
              },
            )
        ],
      ),
    );
  }
}
