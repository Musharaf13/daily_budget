List<ExpenseHistoryModel> expenseHistoryModelFromJson(dynamic response) =>
    List<ExpenseHistoryModel>.from(
        response.map((x) => ExpenseHistoryModel.fromJson(x)));

class ExpenseHistoryModel {
  ExpenseHistoryModel({
    required this.totalExpense,
    required this.categoryId,
    required this.amount,
    required this.description,
  });

  String totalExpense;
  int categoryId;
  String amount;
  String description;

  factory ExpenseHistoryModel.fromJson(Map<String, dynamic> json) =>
      ExpenseHistoryModel(
        totalExpense: json["total_expense"],
        categoryId: json["category_id"],
        amount: json["amount"],
        description: json["description"],
      );
}
