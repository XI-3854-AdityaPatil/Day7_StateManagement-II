import 'package:day7_demo/data/endpoint/home/home_endpoint.dart';
import 'package:day7_demo/data/repository/home/home_repository_impl.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

// @GenerateMocks([HomeEndpoint])
// void main() {
//   late MockHomeEndpoint mockHomeEndpoint;
//   late HomeRepositoryImpl homeRepositoryImpl;
//
//   setUp(() {
//     mockHomeEndpoint = MockHomeEndpoint();
//     homeRepositoryImpl = HomeRepositoryImpl(mockHomeEndpoint);
//   });
//
//   test('getQuotesApi - failure case', () async {
//     // Arrange
//
//     // Mock the behavior of AuthEndpoint's loginApi method to throw an exception
//     when(mockHomeEndpoint.quotesApi()).thenThrow(Exception("Unexpected error"));
//
//     // Act
//     final result = await homeRepositoryImpl.quoteApi();
//
//     // Assert
//     expect(result.status, Status.FAIL);
//   });
// }
