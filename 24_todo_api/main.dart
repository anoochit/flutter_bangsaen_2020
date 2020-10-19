import 'dart:io';
import 'package:angel_hot/angel_hot.dart';
import 'package:hive/hive.dart';

import 'server.dart';

import 'database/database.dart';

void main() async {
  // init hive
  Hive
    ..init(Directory.current.path)
    ..registerAdapter(TodoAdapter());

  var hot = HotReloader(createServer, [
    'server.dart',
  ]);

  await hot.startServer('127.0.0.1', 3000);
}
