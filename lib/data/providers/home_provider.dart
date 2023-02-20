import 'package:daily_budget/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/expense_analytics_model.dart';
import '../models/montthly_budget_details_model.dart';

class HomeProvider {
  String baseUrl = 'http://192.168.0.49';
  String part2 = ':4000';

  String addExpensePath = '/expense/add';
  String analyticsPath = "/expense/fetchExpansesAnalysis";

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> addExpense({
    required categoryId,
    required double amount,
    required String description,
    String date = "",
  }) async {
    // setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");

    debugPrint("http://192.168.21::4000/user/login");
    Response response = await dio.post("$kbaseUrl$addExpensePath", data: {
      // Response response = await dio.post(kbaseUrl + addExpensePath, data: {
      "categoryId": categoryId,
      "amount": amount,
      "description": description,
      "userId": box.read("userId"),
      "date": date,
    });
    debugPrint("login response: ${response.data}");

    return response.data;
  }

  Future<dynamic> fetchExpenseAnalytics(
      {required String startDate,
      required String endDate,
      required String userId}) async {
    // setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");
    debugPrint(
        "${{"userId": userId, "startDate": startDate, "endDate": endDate}}");

    debugPrint("sending UserId: ${userId}");
    debugPrint("http://192.168.72::4000/expense/fetchExpansesAnalysis");
    // Response response = await dio.post(
    // "http://192.168.0.72:4000/expense/fetchExpansesAnalysis",
    Response response = await dio.post(kbaseUrl + analyticsPath,
        data: {"userId": userId, "startDate": startDate, "endDate": endDate});
    // await dio.post(kbaseUrl + analyticsPath, data: {"userId": 2});
    debugPrint("response from expense analytics: ${response.data}");
    debugPrint("response from expense analytics: ${response.data}");
    debugPrint("login response: ${response.data}");
    var result = response.data["data"];
    return {
      "expennseData": ExpenseAnalyticsModelFromJson(result["expenseAnalysis"]),
      "limits": monthlyBudgetDetailsModelFromJson(result["limits"][0])
    };
  }
}
