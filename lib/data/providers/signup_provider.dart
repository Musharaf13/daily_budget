import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';

class SignupProvider {
  String baseUrl = 'http://192.168.0.19';
  String part2 = ':4000';

  String signupPath = '/user/signup';

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> signup(
      {required String email,
      required String password,
      required String phoneNumber}) async {
    setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");
    debugPrint("http://192.168.0.22:4000/user/signup");
    Response response = await dio.post(kbaseUrl + signupPath, data: {
      "email": email,
      "password": password,
      "phone_number": phoneNumber
    });
    debugPrint("login response: ${response.data}");
    return response.data;
  }

  Future<dynamic> sendCode() async {
    return true;
  }
}
