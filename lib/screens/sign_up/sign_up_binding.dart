import 'package:daily_budget/screens/sign_up/sign_up_controller.dart';
import 'package:get/instance_manager.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController(), permanent: true);
  }
}
