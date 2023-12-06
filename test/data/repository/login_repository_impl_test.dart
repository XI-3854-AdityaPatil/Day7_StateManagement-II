import 'package:day7_demo/data/endpoint/auth_endpoint.dart';
import 'package:day7_demo/data/model/response/login_response_model.dart';
import 'package:day7_demo/data/repository/login_repository_impl.dart';
import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([AuthEndpoint])
void main() {
  late MockAuthEndpoint mockAuthEndpoint;
  late LoginRepositoryImpl loginRepositoryImpl;

  setUp(() {
    mockAuthEndpoint = MockAuthEndpoint();
    loginRepositoryImpl = LoginRepositoryImpl(mockAuthEndpoint);
  });

  test('loginApi - success case', () async {
    // Arrange
    const loginRequest =
        LoginRequestEntity(username: 'testUser', password: 'testPassword');
    const expectedResponse = LoginResponseModel(
      id: 123,
      username: 'testUser',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      gender: 'Male',
      image: 'profile.jpg',
      token: 'token123',
    );

    // Mock the behavior of AuthEndpoint's loginApi method
    when(mockAuthEndpoint.loginApi(any))
        .thenAnswer((_) async => expectedResponse);

    // Act
    final result =
        await loginRepositoryImpl.loginApi(loginRequest: loginRequest);

    // Assert
    expect(result.status, Status.SUCCESS);
    expect((result as Success<LoginEntity?>).data?.firstName, isNotNull);
  });

  test('loginApi - failure case', () async {
    // Arrange
    const loginRequest =
        LoginRequestEntity(username: 'testUser', password: 'testPassword');

    // Mock the behavior of AuthEndpoint's loginApi method to throw an exception
    when(mockAuthEndpoint.loginApi(any)).thenThrow(Exception('Network error'));

    // Act
    final result =
        await loginRepositoryImpl.loginApi(loginRequest: loginRequest);

    // Assert
    expect(result.status, Status.FAIL);
  });
}
