import 'package:day7_demo/domain/entities/login_entity.dart';
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/usecase/user_login_usecase.dart';
import '../util/network/resource.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUsecase) : super(LoginInitial());

  final LoginUsecase _loginUsecase;

  Future<void> login(
      {required String username, required String password}) async {
    emit(LoginLoadingState());

    final response = await _loginUsecase.userLogin(
        requestEntity: LoginRequestEntity(
      username: username,
      password: password,
    ));

    if (response.status == Status.SUCCESS) {
      final loginEntity = (response as Success<LoginEntity?>).data;

      if (loginEntity == null) {
        emit(LoginFailedState(errorMessage: ""));
      } else {
        emit(LoginSuccessState(userName: 'Hello ${loginEntity.firstName}'));
      }
    } else if(response.status == Status.FAIL){
      final errorLoginEntity = (response as Fail<LoginEntity?>).error;
      emit(LoginFailedState(errorMessage: errorLoginEntity.message));
    } else {
      emit(LoginFailedState(errorMessage: "Error"));
    }
  }
}
