import 'dart:convert';

import 'package:dio/dio.dart';

class SignUpRepository {
  SignUpRepository();
  
  signUp(username, email, password, confirmPassword) async{
    return Future.delayed(Duration(seconds: 3),() async{
    final data = jsonEncode({
        'user_name': username,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword
      });
    var response = await Dio().post('http://10.0.2.2:3000/api/v1/auth/user/new', data: data);
    return response.data;
    });
    
  }

}