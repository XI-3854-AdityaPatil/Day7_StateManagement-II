import 'package:day7_demo/domain/entities/home/quotes_entity.dart';
import 'package:day7_demo/domain/repository/home/home_repository.dart';
import 'package:day7_demo/util/network/failure.dart';
import 'package:day7_demo/util/network/resource.dart';

import '../../endpoint/home/home_endpoint.dart';

// class HomeRepositoryImpl extends HomeRepository {
//   final HomeEndpoint _homeEndpoint;
//
//   HomeRepositoryImpl(this._homeEndpoint);
//
//   @override
//   Future<Result<List<QuoteEntity>>> quoteApi() {
//     try {
//
//     } catch(ex) {
//       // return Result.error(Failure("0", message));
//     }
//   }
// }
