part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {

  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthState{
  const AuthLoadingState();
}

class AuthAuthenticatedState extends AuthState{
  final String token;
  const  AuthAuthenticatedState({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthErrorState extends AuthState{
  final String message;
  const AuthErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
