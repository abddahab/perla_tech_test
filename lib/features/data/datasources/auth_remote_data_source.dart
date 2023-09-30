import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:perla_tech/core/network/network_info.dart';
import 'package:perla_tech/core/strings/app_strings.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Dio dio() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
    ));
    return dio;
  }


  @override
  Future<Either< FailureModel, RegisterModel >> register({required String fullName, required String phoneNumber, required String password}) async {
    final data = {
      "full_name": fullName,
      "phone": phoneNumber,
      "password": password
    };


    try{
      final response = await dio().post(BASE_URL + "/test/register", data: data);
      if (response.statusCode == 200) {
        final RegisterModel userModel = RegisterModel.fromJson(response.data);
        return Right(userModel);
      } else

      {
        final FailureModel failureModel = FailureModel.fromJson(response.data);
        return Left(failureModel);
      }
    }

    catch (e){
      return Left(FailureModel (data: [] , message: AppStrings().unexpectedError));
    }



  }

  @override
  Future<Either< FailureModel, LoginModel >> login({required String phoneNumber, required String password}) async {
   final data = {
     "phone" : phoneNumber,
     "password" : password
   };

     try{
       final response = await dio().post(BASE_URL + "/test/log_in", data: data);
       if(response.statusCode == 200) {
         final LoginModel userModel = LoginModel.fromJson(response.data);
         return Right(userModel);
       }else {
         final FailureModel failureModel = FailureModel.fromJson(response.data);
         return Left(failureModel);
       }
     }catch(e){
       return Left(FailureModel (data: [] , message: AppStrings().unexpectedError));
   }


}

  @override
  Future<Unit> logout() {
    // TODO: implement signOut
    throw UnimplementedError();
  }



}