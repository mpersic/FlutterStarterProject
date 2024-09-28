import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'api.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: URLS.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(URLS.users)
  Future<String> getUsers();
}
