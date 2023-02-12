List<ExpenseAnalyticsModel> ExpenseAnalyticsModelFromJson(dynamic response) =>
    List<ExpenseAnalyticsModel>.from(
        response.map((x) => ExpenseAnalyticsModel.fromJson(x)));

class ExpenseAnalyticsModel {
  ExpenseAnalyticsModel({
    required this.amount,
    required this.totalExpense,
    required this.date,
  });

  String amount;
  String totalExpense;
  String date;

  factory ExpenseAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      ExpenseAnalyticsModel(
        amount: json["amount"],
        totalExpense: json["total_expense"],
        date: json["date"],
      );
}
