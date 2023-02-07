import 'package:daily_budget/screens/forget_password/forget_password_controller.dart';
import 'package:get/instance_manager.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgetPasswordController());
  }
}
