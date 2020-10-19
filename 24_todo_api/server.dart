import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:angel_framework/angel_framework.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import 'database/database.dart';

Future<Angel> createServer() async {
  // init app
  var app = new Angel()..serializer = json.encode;

  // app router
  app.get('/', (req, res) => {'hello': 'hot world!'});

  app.get('/todos', (req, res) => getAllTodo);

  app.get('/todos/:id', (req, res) => getTodoById);

  app.post('/todos', (req, res) => postTodo);

  app.put('/todos/:id', (req, res) => putTodoById);

  app.delete('/todos', (req, res) => deleteAllTodo);

  app.get('/complete', (req, res) => getCompleteTodo);

  // app fallback
  app.fallback((req, res) => throw new AngelHttpException.notFound());

  // app encoder
  app.encoders.addAll({
    'gzip': gzip.encoder,
    'deflate': zlib.encoder,
  });

  // app logger
  app.logger = new Logger('angel')
    ..onRecord.listen((rec) {
      print(rec);
    });

  return app;
}

// request handler
Future<FutureOr> getAllTodo(RequestContext req, ResponseContext res) async {
  try {
    var box = await Hive.openBox('todo');

    List<Todo> todoList = [];

    box.values.forEach((element) {
      Todo item = element;
      todoList.add(item);
    });

    res.serialize(todoList);
  } catch (e) {
    throw new AngelHttpException.badRequest();
  }
}

Future<FutureOr> getCompleteTodo(RequestContext req, ResponseContext res) async {
  try {
    var box = await Hive.openBox('todo');

    List<Todo> todoList = [];

    box.values.forEach((element) {
      Todo item = element;
      if (item.complete == true) {
        todoList.add(item);
      }
    });

    res.serialize(todoList);
  } catch (e) {
    throw new AngelHttpException.badRequest();
  }
}

Future<FutureOr> deleteAllTodo(RequestContext req, ResponseContext res) async {
  try {
    var box = await Hive.openBox('todo');
    box.clear();

    res.json({'msg': 'ok'});
  } catch (e) {
    throw new AngelHttpException.badRequest();
  }
}

Future<FutureOr> getTodoById(RequestContext req, ResponseContext res) async {
  try {
    var box = await Hive.openBox('todo');

    Todo result = box.get(req.params['id']);

    res.serialize(result);
  } catch (e) {
    throw new AngelHttpException.badRequest();
  }
}

Future<FutureOr> postTodo(RequestContext req, ResponseContext res) async {
  try {
    await req.parseBody();
    var result = req.bodyAsMap;

    var box = await Hive.openBox('todo');

    var key = Uuid().v1();

    var item = Todo()
      ..id = key
      ..title = result['title']
      ..complete = false;

    box.put(key, item);

    res.serialize(item);
  } catch (e) {
    throw new AngelHttpException.badRequest();
  }
}

Future<FutureOr> putTodoById(RequestContext req, ResponseContext res) async {
  try {
    await req.parseBody();
    var result = req.bodyAsMap;

    var box = await Hive.openBox('todo');

    var item = Todo()
      ..id = req.params['id']
      ..title = result['title']
      ..complete = result['complete'];

    box.put(req.params['id'], item);

    res.serialize(item);
  } catch (e) {
    throw new AngelHttpException.badRequest();
  }
}
