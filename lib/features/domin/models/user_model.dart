
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  Data data;

  RegisterModel({
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  User user;
  String token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  int? id;
  String? username;
  int? points;
  String? phone;
  String? imagePath;
  DateTime? timestamp;
  String? userType;

  User({
    required this.id,
    required this.username,
    required this.points,
    required this.phone,
    required this.imagePath,
    required this.timestamp,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    points: json["points"],
    phone: json["phone"],
    imagePath: json["image_path"],
    timestamp: DateTime.parse(json["timestamp"]),
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "points": points,
    "phone": phone,
    "image_path": imagePath,
    "timestamp": timestamp?.toIso8601String(),
    "user_type": userType,
  };
}


LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Data data;

  LoginModel({
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}
