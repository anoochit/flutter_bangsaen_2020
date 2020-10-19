import 'package:chopper/chopper.dart';

part 'todo_api_service.chopper.dart';

@ChopperApi(baseUrl: '/todos')
abstract class TodoApiService extends ChopperService {
  @Get()
  Future<Response> getTodos();

  @Get(path: '/{id}')
  Future<Response> getTodo(@Path('id') String id);

  @Post()
  Future<Response> postTodo(
    @Body() Map<String, dynamic> body,
  );

  static TodoApiService create() {
    final client = ChopperClient(
        baseUrl: 'http://f8a57044f71e.ngrok.io',
        services: [
          _$TodoApiService(),
        ],
        converter: JsonConverter());
    return _$TodoApiService(client);
  }
}
