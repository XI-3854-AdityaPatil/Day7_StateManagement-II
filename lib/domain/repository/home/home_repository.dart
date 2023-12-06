import 'package:day7_demo/domain/entities/home/quotes_entity.dart';

import '../../../util/network/resource.dart';

abstract class HomeRepository {
  Future<Result<List<QuoteEntity>>> quoteApi();
}
