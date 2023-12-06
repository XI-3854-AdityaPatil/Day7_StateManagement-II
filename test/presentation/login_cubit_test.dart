import 'package:bloc_test/bloc_test.dart';
import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';
import 'package:day7_demo/domain/usecase/user_login_usecase.dart';
import 'package:day7_demo/presentation/login_cubit.dart';
import 'package:day7_demo/util/network/failure.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_cubit_test.mocks.dart';

@GenerateMocks([LoginUsecase])
void main() {
  late MockLoginUsecase mockLoginUsecase;
  late LoginCubit loginCubit;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginCubit = LoginCubit(mockLoginUsecase);
  });

  group('LoginCubit', () {
    const loginEntity = LoginEntity(
      id: 123,
      username: 'testUser',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      gender: 'Male',
      image: 'profile.jpg',
      token: 'token123',
    );

    blocTest(
      'should emit success state on success response',
      build: () => loginCubit,
      act: (LoginCubit cubit) async {
        final result = Future.value(const Result.success(loginEntity));

        when(mockLoginUsecase.userLogin(
            requestEntity: const LoginRequestEntity(
          username: "testUser",
          password: "testPassword",
        ))).thenAnswer((realInvocation) => result);

        // Call the login method to trigger the asynchronous operation
        await cubit.login(username: "testUser", password: "testPassword");
        // Wait for the asynchronous operation to complete
        await Future.delayed(Duration.zero);
      },
      expect: () => [
        isA<LoginLoadingState>(),
        isA<LoginSuccessState>(),
      ],
    );

    blocTest(
      'should emit failure state on error response',
      build: () => loginCubit,
      act: (LoginCubit cubit) async {
        const error = Failure("", "");

        final Future<Result<LoginEntity>> result =
            Future.value(const Result.error(error));

        when(mockLoginUsecase.userLogin(
            requestEntity: const LoginRequestEntity(
          username: "testUser",
          password: "testPassword",
        ))).thenAnswer((realInvocation) => result);

        // Call the login method to trigger the asynchronous operation
        await cubit.login(username: "testUser", password: "testPassword");

        // Wait for the asynchronous operation to complete
        await Future.delayed(Duration.zero);
      },
      expect: () => [
        isA<LoginLoadingState>(),
        isA<LoginFailedState>(),
      ],
    );
  });
}
