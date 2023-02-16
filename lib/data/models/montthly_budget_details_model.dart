// To parse this JSON data, do
//
//     final monthlyBudgetDetailsModel = monthlyBudgetDetailsModelFromJson(jsonString);

MonthlyBudgetDetailsModel monthlyBudgetDetailsModelFromJson(dynamic res) =>
    MonthlyBudgetDetailsModel.fromJson(res);

class MonthlyBudgetDetailsModel {
  MonthlyBudgetDetailsModel({
    required this.id,
    required this.userId,
    required this.monthlyBudget,
    required this.workingDayBudget,
    required this.weekendsBudget,
    required this.dailyBudget,
    required this.createdAt,
  });

  int id;
  int userId;
  String monthlyBudget;
  String workingDayBudget;
  String weekendsBudget;
  String dailyBudget;
  DateTime createdAt;

  factory MonthlyBudgetDetailsModel.fromJson(Map<String, dynamic> json) =>
      MonthlyBudgetDetailsModel(
        id: json["id"],
        userId: json["user_id"],
        monthlyBudget: json["monthly_budget"],
        workingDayBudget: json["working_day_budget"],
        weekendsBudget: json["weekends_budget"],
        dailyBudget: json["daily_budget"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
