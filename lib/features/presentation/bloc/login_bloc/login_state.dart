part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginLoadingState extends LoginState{
  LoginLoadingState();
}

class LoginSuccessState extends LoginState{
  final LoginModel loginModel;
  LoginSuccessState({required this.loginModel});


}

class LoginErrorState extends LoginState{
  final String message;
  LoginErrorState({required this.message});

}
