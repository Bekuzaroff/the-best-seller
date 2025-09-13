import 'dart:convert';

import 'package:dio/dio.dart';

class LoginRepository {
  LoginRepository();
  login({required String email, required String password}) async{
    return Future.delayed(Duration(seconds: 3),() async{
      final data = jsonEncode({
          'email': email,
          'password': password
        });
      var response = await Dio().post('http://10.0.2.2:3000/api/v1/auth/user', data: data);
      return response.data;
    });
}
}
  