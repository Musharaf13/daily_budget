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
  });

  int id;
  int userId;
  String monthlyBudget;
  String workingDayBudget;
  String weekendsBudget;
  String dailyBudget;
  // DateTime createdAt;

  factory MonthlyBudgetDetailsModel.fromJson(Map<String, dynamic> json) =>
      MonthlyBudgetDetailsModel(
        id: json["id"] ?? -1,
        userId: json["user_id"] ?? -1,
        monthlyBudget: json["monthly_budget"] ?? 0,
        workingDayBudget: json["working_day_budget"] ?? 0,
        weekendsBudget: json["weekends_budget"] ?? 0,
        dailyBudget: json["daily_budget"] ?? 0,
      );
}
