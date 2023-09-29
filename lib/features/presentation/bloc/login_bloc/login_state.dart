part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginLoadingState extends LoginState{
  LoginLoadingState();
}

class LoginSuccessState extends LoginState{
  final String token;
  final User user;
  LoginSuccessState({required this.token , required this.user});


}

class LoginErrorState extends LoginState{
  final String message;
  LoginErrorState({required this.message});

}
