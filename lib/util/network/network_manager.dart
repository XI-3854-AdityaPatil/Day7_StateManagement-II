import 'package:dio/dio.dart';

import 'network_constant.dart';

Dio initialiseDefaultDio() {
  final dio = Dio();
  dio
    .options = _initialiseGlobalDefaults();
  return dio;
}

BaseOptions _initialiseGlobalDefaults() {
  final BaseOptions baseOptions = BaseOptions()
    ..baseUrl = baseUrl
    ..contentType = Headers.jsonContentType
    ..receiveDataWhenStatusError = true;
  return baseOptions;
}


// RetryInterceptor _retryInterceptor(Dio dio) =>
//     RetryInterceptor(requestRetry: RequestRetrier(dio, locator.get()));