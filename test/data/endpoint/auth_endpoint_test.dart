// Mock class for Dio
import 'package:day7_demo/data/endpoint/auth_endpoint.dart';
import 'package:day7_demo/data/model/request/login_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late AuthEndpoint authEndpoint;

  setUp(() {
    dio = MockDio();
    authEndpoint = AuthEndpoint(dio);
  });

  test('loginApi - error case', () async {
    // Arrange
    const loginRequestModel = LoginRequestModel(username: 'testUser', password: 'testPassword');

    // Mock the behavior of Dio's post method to throw an exception
    when(dio.post("", data: anyNamed('data')))
        .thenThrow(DioException(requestOptions: RequestOptions()));

    // Act and Assert
    expect(() async => await authEndpoint.loginApi(loginRequestModel),
        throwsA(isInstanceOf<DioException>()));
  });
}