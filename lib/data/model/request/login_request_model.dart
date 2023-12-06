import 'package:json_annotation/json_annotation.dart';
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends LoginRequestEntity {
  const LoginRequestModel({
    required String username,
    required String password,
  }) : super(
          username: username,
          password: password,
        );

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
