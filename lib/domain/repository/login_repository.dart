import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';

import '../../util/network/resource.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Result<LoginEntity>> loginApi(
      {required LoginRequestEntity loginRequest});
}
