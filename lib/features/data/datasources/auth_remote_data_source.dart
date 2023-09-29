import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:perla_tech/core/error/exception.dart';
import 'package:perla_tech/features/data/models/failure_model.dart';
import 'package:perla_tech/features/data/models/user_model.dart';

import '../../domin/entities/auth.dart';
import '';

abstract class AuthRemoteDataSource{

  Future<Either< FailureModel, UserModel >> register({ required String fullName ,required String phoneNumber , required String password});
  Future<Either< FailureModel, UserModel >> login({required String phoneNumber , required String password});
  Future<Unit> logout();

}
const BASE_URL = 'https://talebadmin.perla-tech.com';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final Dio dio ;

  AuthRemoteDataSourceImpl({required this.dio});


  @override
  Future<Either< FailureModel, UserModel >> register({required String fullName, required String phoneNumber, required String password}) async {
    final data = {
      "full_name" : fullName ,
      "phone" : phoneNumber,
      "password" : password
    };
    final response = await dio.post(Uri.parse(BASE_URL + "/test/register") as String ,data: data );
    if(response.statusCode == 200){
      final decodedJson = json.decode(response.data);
      final UserModel userModel = UserModel.fromJson(decodedJson);
      return Right(userModel);

     }else if(response.statusCode == 422){
      final decodedJson = json.decode(response.data);
      final FailureModel failureModel = FailureModel.fromJson(decodedJson);
      return Left(failureModel);
    }else
      throw ServerException();
  }

  @override
  Future<Either< FailureModel, UserModel >> login({required String phoneNumber, required String password}) async {
   final data = {
     "phone" : phoneNumber,
     "password" : password
   };

    final response = await dio.post(Uri.parse(BASE_URL + "/test/log_in") as String , data: data);
    final decodedJson = json.decode(response.data);
    if(response.statusCode == 200) {
      final UserModel userModel = UserModel.fromJson(decodedJson);
      return Right(userModel);
    }else if(response.statusCode == 402){
      final FailureModel failureModel = FailureModel.fromJson(decodedJson);
    }
    throw ServerException();
}

  @override
  Future<Unit> logout() {
    // TODO: implement signOut
    throw UnimplementedError();
  }



}