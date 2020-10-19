import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_request/models/todo.dart';

part 'todo_service.g.dart';

@RestApi(baseUrl: 'http://a11df340fa67.ngrok.io')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/todos")
  Future<List<Todo>> getTodos();

  @GET("/todos/{id}")
  Future<Todo> getTodo(@Path("id") String id);

  @PUT("/todos/{id}")
  Future<Todo> updateTodo(@Path() String id, @Body() Todo todo);

  @POST("/todos")
  Future<String> postFormData(@Body() Todo todo);
}
