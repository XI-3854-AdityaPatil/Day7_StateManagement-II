part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {
  final String userName;

  LoginSuccessState({required this.userName});
}

class LoginFailedState extends LoginState {
  final String errorMessage;

  LoginFailedState({required this.errorMessage});
}

class LoginLoadingState extends LoginState {}
