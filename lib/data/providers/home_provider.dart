import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeProvider {
  String baseUrl = 'http://192.168.0.19';
  String part2 = ':4000';

  String loginPath = '/user/login';

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> addExpense({
    required categoryId,
    required double amount,
    required String description,
  }) async {
    // setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");

    debugPrint("http://192.168.0.29:4000/user/login");
    Response response =
        await dio.post("http://192.168.0.29:4000/expense/add", data: {
      "categoryId": categoryId,
      "amount": amount,
      "description": description,
      "userId": 2
    });
    debugPrint("login response: ${response.data}");

    return response.data;
  }
}
