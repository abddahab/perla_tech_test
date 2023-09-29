import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domin/models/user_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEventRequest, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEventRequest>((event, emit) {
      // TODO: implement event handler
    });
  }
}
