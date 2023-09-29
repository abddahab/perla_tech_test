import 'dart:convert';

FailureModel failureModelFromJson(String str) => FailureModel.fromJson(json.decode(str));

String failureModelToJson(FailureModel data) => json.encode(data.toJson());

class FailureModel {
  List<dynamic> data;
  String message;

  FailureModel({
    required this.data,
    required this.message,
  });

  factory FailureModel.fromJson(Map<String, dynamic> json) => FailureModel(
    data: List<dynamic>.from(json["data"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x)),
    "message": message,
  };
}