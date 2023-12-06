import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';
import 'package:day7_demo/domain/usecase/user_login_usecase.dart';
import 'package:day7_demo/presentation/login_cubit.dart';
import 'package:day7_demo/presentation/login_screen.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_screen_test.mocks.dart';

@GenerateMocks([LoginUsecase])
void main() {
  late MockLoginUsecase mockLoginUsecase;
  late LoginCubit loginCubit;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginCubit = LoginCubit(mockLoginUsecase);

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

    final result = Future.value(const Result.success(loginEntity));
    // Add the stub for userLogin method
    when(mockLoginUsecase.userLogin(
        requestEntity: const LoginRequestEntity(
      username: "testUser",
      password: "testPassword",
    ))).thenAnswer((_) async => result);
  });

  group('LoginScreen Widget Test', () {
    testWidgets('Renders UI correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(mockLoginUsecase),
            // Create a mock LoginCubit for testing
            child: const LoginScreen(),
          ),
        ),
      );

      // Verify that the UI elements are rendered correctly.
      expect(find.text('Login'), findsAtLeastNWidgets(2));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);

      // You can add more tests based on your UI requirements.

      // Example: Test tapping the login button.
      await tester.tap(find.byKey(const ValueKey("btn_forgot_password")));
      await tester.pump();

    });
  });
}
