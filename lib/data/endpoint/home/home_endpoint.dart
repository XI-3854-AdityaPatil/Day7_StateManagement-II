import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../model/response/home/quote_response_model.dart';

part 'home_endpoint.g.dart';

@RestApi()
abstract class HomeEndpoint {
  factory HomeEndpoint(Dio dio, {String baseUrl}) = _HomeEndpoint;

  /// QUOTES API
  @POST('/quotes')
  Future<List<QuotesResponseModel>> quotesApi();
}
