import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:perla_tech/features/domin/entities/failure.dart';
import 'package:perla_tech/features/domin/entities/user.dart';

import '../entities/auth.dart';

abstract class AuthRepository{

 Future<Either< Failure, User >> register ({required String fullName, required String phoneNumber, required String password});
 Future<Either<Failure , User>> login ({required String phoneNumber, required String password});
 Future<Unit> logout();


}