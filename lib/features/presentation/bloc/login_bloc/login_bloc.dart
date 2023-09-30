import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:perla_tech/features/domin/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/datasources/auth_remote_data_source.dart';
import '../../../domin/models/failure_model.dart';



part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDataSourceImpl authRemoteDataSource = AuthRemoteDataSourceImpl();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEventRequest>((event, emit) async {
      emit(LoginLoadingState());
      Either< FailureModel, LoginModel > failureOrDone = await authRemoteDataSource.login(phoneNumber: event.phone, password: event.password);
      SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
      failureOrDone.fold(
              (failure) => emit(LoginErrorState(message: failure.message)),
      (r) {
        sharedPreferences.setString("userName", r.data.user.username??'');
        emit(LoginSuccessState(loginModel: r));
      }
      );


    });
  }
}
