import 'package:day7_demo/data/model/request/login_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginRequestModel', () {
    test('toJson should return a Map with correct values', () {
      // Arrange
      const loginRequestModel = LoginRequestModel(
        username: 'testUser',
        password: 'testPassword',
      );

      // Act
      final jsonMap = loginRequestModel.toJson();

      // Assert
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['username'], 'testUser');
      expect(jsonMap['password'], 'testPassword');
    });
  });
}