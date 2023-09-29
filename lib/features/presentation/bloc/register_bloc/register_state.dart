part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}




class RegisterLoadingState extends RegisterState{
   RegisterLoadingState();
}

class RegisterSuccessState extends RegisterState{
  final String token;
  final RegisterModel registerModel;
    RegisterSuccessState({required this.token , required this.registerModel});


}

class RegisterErrorState extends RegisterState{
  final String message;
  RegisterErrorState({required this.message});

}
