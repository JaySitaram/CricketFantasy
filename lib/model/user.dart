import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? referCode;
  @HiveField(4)
  String? date;
  @HiveField(5)
  String? country;
  @HiveField(6)
  String? city;
  @HiveField(7)
  String? state;
  @HiveField(8)
  String? gender;
  @HiveField(9)
  String? image;

  User({this.name,this.email,this.phone,this.referCode,this.date,this.country,this.city,this.state,this.gender,this.image});
}