import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class LoginProvider {
  String baseUrl = 'http://192.168.0.19';
  String part2 = ':4000';

  String loginPath = "/user/login";

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> login(
      {required String email, required String password}) async {
    // setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");
    debugPrint("http://192.168.0.21:4000/user/login");
    Response response = await dio.post("$kbaseUrl$loginPath",
        data: {"email": email, "password": password});
    debugPrint("login response: ${response.data}");

    return response.data;
  }

  Future<dynamic> sendCode() async {
    return true;
  }
}
