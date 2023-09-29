import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:perla_tech/core/error/exception.dart';
import 'package:perla_tech/core/error/failure.dart';
import 'package:perla_tech/features/data/models/auth_model.dart';
import 'package:perla_tech/features/data/models/user_model.dart';
import 'package:perla_tech/features/domin/entities/auth.dart';
import 'package:perla_tech/features/domin/entities/failure.dart';
import 'package:perla_tech/features/domin/entities/user.dart';
import 'package:perla_tech/features/domin/repositories/auth_repository.dart';

import '../../../core/network/network_info.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/failure_model.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.remoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, User>> register({required String fullName, required String phoneNumber, required String password}) async{
    if (await networkInfo.isConnected) {

      }
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, User>> login({required String phoneNumber, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Unit> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }





}