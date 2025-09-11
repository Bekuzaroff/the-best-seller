import 'dart:convert';

import 'package:dio/dio.dart';

class SignUpRepository {
  SignUpRepository();
  
  signUp(user_name, email, password, confirm_password) async{
    return Future.delayed(Duration(seconds: 3),() async{
    final data = jsonEncode({
        'user_name': user_name,
        'email': email,
        'password': password,
        'confirm_password': confirm_password
      });
    var response = await Dio().post('http://10.0.2.2:3000/api/v1/auth/user/new', data: data);
    return response.data;
    });
    
  }

}