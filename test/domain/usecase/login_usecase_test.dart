import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';
import 'package:day7_demo/domain/repository/login_repository.dart';
import 'package:day7_demo/domain/usecase/user_login_usecase.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';


@GenerateMocks([LoginRepository])
void main() {
  late MockLoginRepository mockLoginRepository;
  late LoginUsecase loginUsecase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    loginUsecase = LoginUsecase(mockLoginRepository);
  });

  group('LoginUsecase', () {
    test('userLogin calls loginApi in LoginRepository', () async {
      // Arrange
      const loginRequestEntity = LoginRequestEntity(username: "test", password: "test@123");
      const expectedResult = Result<LoginEntity>.success(LoginEntity(
          id: 0,
          email: "",
          firstName: "",
          lastName: "",
          gender: "",
          image: "",
          token: "",
          username: ""));

      // Act
      when(mockLoginRepository.loginApi(loginRequest: loginRequestEntity))
          .thenAnswer((_) => Future.value(expectedResult));

      final result =
          await loginUsecase.userLogin(requestEntity: loginRequestEntity);

      // Assert
      verify(mockLoginRepository.loginApi(loginRequest: loginRequestEntity));
      expect(result, expectedResult);
    });
  });
}
