import 'package:daily_budget/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ForgetPasswordProvider {
  String baseUrl = 'http://192.168.0.19';
  String part2 = ':4000';

  String updatePasswordPath = '/user/updatePassword';

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> updatePassword(
      {required String phoneNumber, required String password}) async {
    setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");
    debugPrint("http://192.168.0.25:4000/user/updatePassword");
    Response response = await dio.post(kbaseUrl + updatePasswordPath,
        data: {"phone_number": phoneNumber, "new_password": password});
    debugPrint("update Password response: ${response.data}");
    debugPrint("Reesponse from update password: ${response.data}");
    return response.data;
  }

  Future<dynamic> sendCode() async {
    return true;
  }
}
