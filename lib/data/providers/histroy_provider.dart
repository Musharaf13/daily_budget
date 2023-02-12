import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/expense_history_model.dart';

class HistoryProvider {
  String baseUrl = 'http://192.168.0.19';
  String part2 = ':4000';

  String loginPath = '/user/login';

  Dio dio = new Dio();
  // Response response = Response(requestOptions: RequestOptions(path: ""));

  Future<dynamic> fetchExpenseHistory(
      {required String startDate,
      required String endDate,
      required List<int> categoryIds}) async {
    debugPrint("http://192.168.0.21:4000/expense/fetchAllExpenses");
    Response response = await dio
        .post("http://192.168.0.21:4000/expense/fetchAllExpenses", data: {
      "startDate": startDate,
      "endDate": endDate,
      "userId": 2,
      "categoryIds": categoryIds
    });
    debugPrint("Fetch History response: ${response.data}");

    return expenseHistoryModelFromJson(response.data["data"]);
  }
}
