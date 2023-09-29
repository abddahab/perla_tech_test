import 'package:perla_tech/features/domin/entities/auth.dart';

class AuthModel extends Auth{

  const AuthModel({required String? token}) : super(token: token);

  factory AuthModel.fromJson(Map<String , dynamic> json){
    return AuthModel(
      token: json['token'] as String?,
    );
  }

}