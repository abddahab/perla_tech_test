part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthEvent{}

class RegisterEvent extends AuthEvent {
  final String name;
  final String phone;
  final String password;

  const RegisterEvent({required this.name ,required this.phone, required this.password});

  @override
  List<Object> get props => [name,phone, password];
}


class LoggedInEvent extends AuthEvent {
  final String phone;
  final String password;

  const LoggedInEvent({required this.phone , required this.password});
  @override
  List<Object> get props => [phone ,password];
}

class LoggedOutEvent extends AuthEvent{}

