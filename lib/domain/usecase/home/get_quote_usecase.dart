import 'package:day7_demo/domain/entities/home/quotes_entity.dart';
import 'package:day7_demo/domain/repository/home/home_repository.dart';

import '../../../util/network/resource.dart';

class GetQuotesUsecase {
  final HomeRepository _repository;

  GetQuotesUsecase(this._repository);

  Future<Result<List<QuoteEntity>>> getQuotes() {
    return _repository.quoteApi();
  }
}
