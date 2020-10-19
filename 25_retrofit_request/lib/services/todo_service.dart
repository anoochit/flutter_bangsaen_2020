import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_request/models/todo.dart';

part 'todo_service.g.dart';

@RestApi(baseUrl: 'http://f8a57044f71e.ngrok.io')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/todos")
  Future<List<Todo>> getTodos();

  @GET("/todos/{id}")
  Future<Todo> getTodo(@Path("id") String id);

  @PUT("/todos/{id}")
  Future<Todo> editTodo(@Path("id") String id);
}
