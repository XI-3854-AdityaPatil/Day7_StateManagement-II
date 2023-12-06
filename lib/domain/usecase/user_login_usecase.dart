import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:day7_demo/domain/repository/login_repository.dart';
import 'package:day7_demo/util/network/resource.dart';

import '../entities/request_entity/login_request_entity.dart';

class LoginUsecase {
  final LoginRepository _loginRepository;

  LoginUsecase(this._loginRepository);

  Future<Result<LoginEntity>> userLogin(
      {required LoginRequestEntity requestEntity}) {
    return _loginRepository.loginApi(loginRequest: requestEntity);
  }
}
