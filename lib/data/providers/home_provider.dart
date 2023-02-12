import 'package:daily_budget/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/expense_analytics_model.dart';

class HomeProvider {
  String baseUrl = 'http://192.168.0.19';
  String part2 = ':4000';

  String addExpensePath = '/expense/add';
  String analyticsPath = "/expense/fetchExpansesAnalysis";

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> addExpense({
    required categoryId,
    required double amount,
    required String description,
  }) async {
    // setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");

    debugPrint("http://192.168.21::4000/user/login");
    Response response = await dio.post(kbaseUrl + addExpensePath, data: {
      "categoryId": categoryId,
      "amount": amount,
      "description": description,
      "userId": 2
    });
    debugPrint("login response: ${response.data}");

    return response.data;
  }

  Future<dynamic> fetchExpenseAnalytics() async {
    // setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");

    debugPrint("http://192.168.32::4000/user/login");
    Response response =
        await dio.post(kbaseUrl + analyticsPath, data: {"userId": 2});
    debugPrint("login response: ${response.data}");

    return ExpenseAnalyticsModelFromJson(response.data["data"]);
  }
}
