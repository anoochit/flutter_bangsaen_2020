import 'package:flutter/material.dart';
import 'database/database.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      child: MyApp(),
      dispose: (context, db) => db.close(),
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

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: database.watchAllTodo(),
                builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                  if (snapshot.hasData) {
                    var todoItems = snapshot.data;
                    return ListView.builder(
                      itemCount: todoItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(todoItems[index].title),
                        );
                      },
                    );
                  }

                  return Text("Loading...");
                },
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                hintText: 'Type your task here !!',
              ),
              onFieldSubmitted: (value) {
                database.addTodo(Todo(id: null, title: "Hello"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
