class User{
final int id;
final String userName;
final String phone;
final int? points;
final String? imagePath;
final String time;
final String? userType;

  User({
    required this.id,
    required this.userName,
    required this.phone,
    this.points,
    this.imagePath,
    required this.time,
    this.userType
  });

}

