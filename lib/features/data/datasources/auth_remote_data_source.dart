import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '';
import '../../domin/models/failure_model.dart';
import '../../domin/models/user_model.dart';

abstract class AuthRemoteDataSource{

  Future<Either< FailureModel, RegisterModel >> register({ required String fullName ,required String phoneNumber , required String password});
  Future<Either< FailureModel, LoginModel >> login({required String phoneNumber , required String password});
  Future<Unit> logout();

}
const BASE_URL = 'https://talebadmin.perla-tech.com';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final Dio dio = Dio() ;


  @override
  Future<Either< FailureModel, RegisterModel >> register({required String fullName, required String phoneNumber, required String password}) async {
    final data = {
      "full_name": fullName,
      "phone": phoneNumber,
      "password": password
    };
    final response = await dio.post(BASE_URL + "/test/register", data: data);
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.data);
      final RegisterModel userModel = RegisterModel.fromJson(decodedJson);
      return Right(userModel);
    } else {
      final decodedJson = json.decode(response.data);
      final FailureModel failureModel = FailureModel.fromJson(decodedJson);
      return Left(failureModel);
    }
  }

  @override
  Future<Either< FailureModel, LoginModel >> login({required String phoneNumber, required String password}) async {
   final data = {
     "phone" : phoneNumber,
     "password" : password
   };

    final response = await dio.post(BASE_URL + "/test/log_in", data: data);
    final decodedJson = json.decode(response.data);
    if(response.statusCode == 200) {
      final LoginModel userModel = LoginModel.fromJson(decodedJson);
      return Right(userModel);
    }else {
      final FailureModel failureModel = FailureModel.fromJson(decodedJson);
      return Left(failureModel);
    }
}

  @override
  Future<Unit> logout() {
    // TODO: implement signOut
    throw UnimplementedError();
  }



}