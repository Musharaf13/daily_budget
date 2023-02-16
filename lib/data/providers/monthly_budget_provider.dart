import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../utils/utils.dart';

class MonthlyBudgetProvider {
  String baseUrl = 'http://192.168.0.19';
  String part2 = ':4000';

  String fetchMonthlyBudgetPath = "/user/fetchMonthlyBudgetDetails";
  String addUpdateMonthlyBudgetPath = "/user/addMonthlyBudget";

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> fetchMonthlyBudgetDetails() async {
    // setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");
    debugPrint("http://192.168.0.10:4000/user/fetchMonthlyBudgetDetails");
    Response response = await dio.get("$kbaseUrl$fetchMonthlyBudgetPath",
        queryParameters: {"userId": box.read("userId")});
    debugPrint("response from Query: ${response.data}");
    return response.data;
  }

  Future<dynamic> updateBudget({
    required int monthlyBudget,
    required int dailyBudget,
    required int workingDaysBudget,
    required int weekendsBudget,
    required int userId,
  }) async {
    setupDioOptions(dio);
    // debugPrint("${baseUrl}${part2}${loginPath}");
    debugPrint("http://192.168.0.10:4000/user/addMonthlyBudget");
    Response response =
        await dio.post("$kbaseUrl$addUpdateMonthlyBudgetPath", data: {
      "userId": userId,
      "monthlyBudget": monthlyBudget,
      "dailyBudget": dailyBudget,
      "workingDaysBudget": workingDaysBudget,
      "weekendsBudget": weekendsBudget
    });
    debugPrint("login response: ${response.data}");
    return "";
  }

  Future<dynamic> sendCode() async {
    return true;
  }
}
