import 'package:day7_demo/data/model/response/home/quote_response_model.dart';
import 'package:day7_demo/domain/entities/home/quotes_entity.dart';
import 'package:day7_demo/domain/repository/home/home_repository.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:dio/dio.dart';

import '../../endpoint/home/home_endpoint.dart';

// class HomeRepositoryImpl extends HomeRepository {
//   final HomeEndpoint _homeEndpoint;
//
//   HomeRepositoryImpl(this._homeEndpoint);
//
//   @override
//   Future<Result<List<QuoteEntity>>> quoteApi() async {
//     try {
//       final List<QuotesResponseModel> response = await _homeEndpoint.quotesApi();
//
//     } catch (e) {
//       var message = "Error";
//       if (e is DioException) {
//         message = e.message ?? '';
//       }
//       // return Result.error(Failure("0", message));
//     }
//   }
// }
