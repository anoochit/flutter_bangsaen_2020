import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Todo {
  String id;
  String title;
  bool complete;

  Todo({this.id, this.title, this.complete});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      complete: json['complete'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['complete'] = this.complete;
    return data;
  }
}

/*
// generate code from json2dart class
@JsonSerializable()
class Todo {
  String id;
  String title;
  bool complete;

  Todo({
    this.id,
    this.title,
    this.complete,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['complete'] = this.complete;
    return data;
  }
}

*/
