import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:perla_tech/features/data/datasources/auth_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domin/models/failure_model.dart';
import '../../../domin/models/user_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEventRequest, RegisterState> {
  final AuthRemoteDataSourceImpl authRemoteDataSource = AuthRemoteDataSourceImpl();

  RegisterBloc() : super(RegisterInitial()) {
    
    on<RegisterEventRequest>((event, emit) async{
      emit(RegisterLoadingState());
      Either<FailureModel, RegisterModel> failureOrDone = await authRemoteDataSource.register(fullName: event.name, phoneNumber: event.phone, password: event.password);
      SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
      failureOrDone.fold(
              (failure) => emit(RegisterErrorState(message: failure.message)),
              (r) {
                sharedPreferences.setString("userName", r.data.user.username??'');
                sharedPreferences.setBool("isRegistered", true);
                emit(RegisterSuccessState(registerModel: r));
              }
      );


    });
  }
}
