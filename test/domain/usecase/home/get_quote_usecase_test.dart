import 'package:day7_demo/domain/entities/home/quotes_entity.dart';
import 'package:day7_demo/domain/repository/home/home_repository.dart';
import 'package:day7_demo/domain/usecase/home/get_quote_usecase.dart';
import 'package:day7_demo/util/network/failure.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_quote_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository mockHomeRepository;
  late GetQuotesUsecase getQuotesUsecase;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getQuotesUsecase = GetQuotesUsecase(mockHomeRepository);
  });

  group('GetQuoteUsecase', () {
    test('getQuotes calls quoteApi in HomeRepository', () async {
      List<QuoteEntity> expectedList = [
        const QuoteEntity(
          id: 1,
          quote: "testQuote",
          author: "testAuthor",
        ),
        const QuoteEntity(
          id: 2,
          quote: "testQuote2",
          author: "testAuthor2",
        )
      ];

      // Arrange
      var expectedResult = Result<List<QuoteEntity>>.success(expectedList);

      // Act
      when(mockHomeRepository.quoteApi())
          .thenAnswer((_) => Future.value(expectedResult));

      final result = await getQuotesUsecase.getQuotes();

      // Assert
      verify(mockHomeRepository.quoteApi());
      expect(result, expectedResult);
    });

    test('getQuotes calls quoteApi in HomeRepository but return failed', () async {
      List<QuoteEntity> expectedList = [
        const QuoteEntity(
          id: 1,
          quote: "testQuote",
          author: "testAuthor",
        ),
        const QuoteEntity(
          id: 2,
          quote: "testQuote2",
          author: "testAuthor2",
        )
      ];

      // Arrange
      var expectedFailedResult = const Result<List<QuoteEntity>>.error(Failure("",""));

      // Act
      when(mockHomeRepository.quoteApi())
          .thenAnswer((_) => Future.value(expectedFailedResult));

      final result = await getQuotesUsecase.getQuotes();

      // Assert
      verify(mockHomeRepository.quoteApi());
      expect(result, expectedFailedResult);
    });
  });
}
