import 'package:daily_budget/screens/monthly_budget/monthly_budget_controller.dart';
import 'package:get/instance_manager.dart';

class MonthlyBudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MonthlyBudgetController());
  }
}
