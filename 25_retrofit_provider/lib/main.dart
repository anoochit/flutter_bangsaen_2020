import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_request/appstate.dart';
import 'package:retrofit_request/services/todo_service.dart';

import 'models/todo.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Todo"),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Consumer<AppState>(
//                 builder: (BuildContext context, value, Widget child) {
//                   var todos = value.listTodo;
//                   return ListView.builder(
//                     itemCount: todos.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return CheckboxListTile(
//                         title: (todos[index].complete == true)
//                             ? Text(
//                                 todos[index].title,
//                                 style: TextStyle(decoration: TextDecoration.lineThrough),
//                               )
//                             : Text(todos[index].title),
//                         onChanged: (value) {
//                           Provider.of<AppState>(context, listen: false).setComplete(todos[index]);
//                         },
//                         value: todos[index].complete,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             Divider(),
//             Container(
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.edit),
//                   hintText: 'Enter your todo here!',
//                 ),
//                 onFieldSubmitted: (value) {
//                   // do something
//                   log("sent data todo => " + value);
//                   Provider.of<AppState>(context, listen: false)
//                       .addTodo(Todo(title: value, complete: false));
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String endPoint = "http://afa43bba8138.ngrok.io";

  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      body: FutureBuilder(
        future: RestClient(dio, baseUrl: endPoint).getTodos(),
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var todos = snapshot.data;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  title: (todos[index].complete == true)
                      ? Text(
                          todos[index].title,
                          style: TextStyle(decoration: TextDecoration.lineThrough),
                        )
                      : Text(todos[index].title),
                  onChanged: (value) {},
                  value: todos[index].complete,
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
