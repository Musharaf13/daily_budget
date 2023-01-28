import 'package:daily_budget/screens/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
    );
  }
}
