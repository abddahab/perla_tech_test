part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}



class LoginEventRequest extends LoginEvent {
  final String phone;
  final String password;

  LoginEventRequest({required this.phone, required this.password});

}
