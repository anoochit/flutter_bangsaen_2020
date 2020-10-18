import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 32)();
}

@UseMoor(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        ));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) {
      return m.createAll();
    });
  }

  // Query

  // Get all data in todos table
  Future<List<Todo>> getAllTodo() => select(todos).get();

  Future<List<Todo>> getTodoById(int id) => (select(todos)..where((t) => t.id.equals(id))).get();

  // Watch data in todos table
  Stream<List<Todo>> watchAllTodo() => select(todos).watch();

  // Insert data in todos table
  Future addTodo(Todo todo) => into(todos).insert(todo);
}
