part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}


class RegisterEventRequest extends RegisterEvent {
  final String name;
  final String phone;
  final String password;

  RegisterEventRequest({required this.name ,required this.phone, required this.password});

}
