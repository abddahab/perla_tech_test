import 'package:perla_tech/features/domin/entities/user.dart';

class UserModel extends User{
  UserModel({
    required super.id,
    required super.userName,
    required super.phone,
    super.points,
    super.imagePath,
    required super.time,
    super.userType
  });

  factory UserModel.fromJson(Map<String , dynamic> json){
    return UserModel(
      id: json['id'],
      userName: json['username'],
      phone: json['phone'] ,
      time:  json['timestamp'] ,
      points:  json['points'],
      imagePath:  json['image_path'],
      userType:  json['user_type']
    );
  }
  Map<String , dynamic> toJson(){
    return{'id': id , 'username':userName , 'phone':phone ,'timestamp':time };
  }
}
