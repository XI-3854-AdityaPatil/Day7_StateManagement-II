import 'package:day7_demo/data/model/request/login_request_model.dart';
import 'package:day7_demo/data/model/response/login_response_model.dart';
import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';
import 'package:day7_demo/domain/repository/login_repository.dart';
import 'package:day7_demo/util/network/failure.dart';
import 'package:day7_demo/util/network/resource.dart';
import 'package:dio/dio.dart';

import '../endpoint/auth_endpoint.dart';

class LoginRepositoryImpl extends LoginRepository {
  final AuthEndpoint _authEndpoint;

  LoginRepositoryImpl(this._authEndpoint);

  @override
  Future<Result<LoginEntity>> loginApi(
      {required LoginRequestEntity loginRequest}) async {
    try {
      final LoginResponseModel response = await _authEndpoint.loginApi(
          LoginRequestModel(
              username: loginRequest.username ?? '',
              password: loginRequest.password ?? ''));

      if (response.id != null) {
        return Result.success(_toLoginEntity(response));
      } else {
        return const Result.error(Failure("0", "Error"));
      }
    } catch (e) {
      var message = "Error";
      if (e is DioException) {
        message = e.message ?? '';
      }
      return Result.error(Failure("0", message));
    }
  }

  LoginEntity _toLoginEntity(LoginResponseModel response) {
    return LoginEntity(
        id: response.id,
        username: response.username,
        email: response.email,
        firstName: response.firstName,
        lastName: response.lastName,
        gender: response.gender,
        image: response.image,
        token: response.token);
  }
}
