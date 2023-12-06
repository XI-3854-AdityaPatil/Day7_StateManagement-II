import 'package:day7_demo/data/model/request/login_request_model.dart';
import 'package:day7_demo/data/model/response/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_endpoint.g.dart';

@RestApi()
abstract class AuthEndpoint {
  factory AuthEndpoint(Dio dio, {String baseUrl}) = _AuthEndpoint;

  /// LOGIN API
  @POST('/auth/login')
  Future<LoginResponseModel> loginApi(@Body() LoginRequestModel body);
}
