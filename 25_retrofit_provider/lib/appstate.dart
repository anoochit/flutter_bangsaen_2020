import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_request/models/todo.dart';
import 'package:retrofit_request/services/todo_service.dart';

class AppState with ChangeNotifier {
  AppState() {
    getTodoList();
  }

  List<Todo> listTodo = [];

  String endPoint = "http://afa43bba8138.ngrok.io";

  getTodoList() async {
    Dio dio = Dio();
    listTodo = await RestClient(dio, baseUrl: endPoint).getTodos();
    notifyListeners();
  }

  setComplete(Todo todo) async {
    Dio dio = Dio();
    var newtodo = todo;
    newtodo.complete = !todo.complete;
    await RestClient(dio, baseUrl: endPoint).updateTodo(todo.id, newtodo);
    notifyListeners();
  }

  addTodo(Todo todo) async {
    Dio dio = Dio();
    await RestClient(dio, baseUrl: endPoint).postFormData(todo).then((value) {
      log("recieve value = " + value);
    });
    notifyListeners();
  }
}
