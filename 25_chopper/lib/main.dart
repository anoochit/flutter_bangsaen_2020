import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/service/todo_api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => TodoApiService.create(),
      dispose: (_, TodoApiService service) => service.dispose(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<TodoApiService>(context).getTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List todos = json.decode(snapshot.data.bodyString);
          return _buildList(context, todos);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  ListView _buildList(BuildContext context, List todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          value: false,
          title: Text(todos[index]['title']),
          onChanged: (bool value) {},
        );
      },
    );
  }
}
