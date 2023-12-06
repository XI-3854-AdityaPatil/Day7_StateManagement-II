import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends LoginEntity {
  const LoginResponseModel(
      {required super.id,
      required super.username,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.gender,
      required super.image,
      required super.token});

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
