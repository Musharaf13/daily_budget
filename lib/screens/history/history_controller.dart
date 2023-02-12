import 'package:daily_budget/constants/constants.dart';
import 'package:daily_budget/data/models/expense_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../data/providers/histroy_provider.dart';

class HistoryController extends GetxController {
  final HistoryProvider provider = HistoryProvider();

  TextEditingController dateRangeController = TextEditingController(
      text:
          "${DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(Duration(days: 7))).toString()} to ${DateFormat("yyyy-MM-dd").format(DateTime.now()).toString()}");

  DateRangePickerController dateController = DateRangePickerController();
  List<String> _selectedCategories = categories;
  List<String> get selectedCategories => _selectedCategories;
  List<ExpenseHistoryModel> expenseHistory = [];

  bool _isExpenseHistoryBeingFetched = false;
  bool get isExpenseHistoryBeingFetched => _isExpenseHistoryBeingFetched;
  set isExpenseHistoryBeingFetched(bool value) {
    _isExpenseHistoryBeingFetched = value;
    update();
  }

  set selectedCategories(value) {
    _selectedCategories = value;
    update();
    fetchExpenseHistory();
  }

  void fetchExpenseHistory() async {
    isExpenseHistoryBeingFetched = true;

//if single date is selected  keep start and end dates same
    List<String> dates = dateRangeController.text.split(" ");
    String startDate = dates[0];
    late String endDate;
    if (dates.length > 1)
      endDate = dates[2];
    else
      endDate = startDate;

    // debugPrint("${startDate}")

    //Converting list of Strings into list of integers
    int count = 1;
    late List<int> categoryIds;
    if (selectedCategories.isEmpty) {
      categoryIds = [
        1,
        2,
        3,
        4,
        5,
      ];
    } else {
      categoryIds =
          selectedCategories.map((str) => allCategoryIds[str]!).toList();
    }

    expenseHistory = await provider.fetchExpenseHistory(
        startDate: startDate, endDate: endDate, categoryIds: categoryIds);

    isExpenseHistoryBeingFetched = false;
  }
}
