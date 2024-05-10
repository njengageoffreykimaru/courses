import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String ? name;
  String ? phone;
  String ? password;
  String ? email;
  UserModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.email
});
  factory UserModel.fromJson(Map<String,dynamic> map){
    return UserModel(
        name: map['name'],
        phone : map['phone'],
        password : map['password'],
        email : map['email'],
    );



  }
  Map<String,dynamic> toJson(){
    return{
      'name': name,
      'phone': phone,
      'password': password,
      'email': email,
    };
  }

  }

