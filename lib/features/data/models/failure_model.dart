import 'package:perla_tech/features/domin/entities/failure.dart';

class FailureModel extends Failure {

  FailureModel({required super.data , required super.message});

  factory FailureModel.fromJson(Map<String, dynamic> json){
    return FailureModel(
      data: json['data'],
      message: json['message'],
    );
  }

}