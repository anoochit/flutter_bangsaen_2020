import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool complete;

  Map toJson() => {
        'id': id,
        'title': title,
        'complete': complete,
      };
}
