import 'package:daily_budget/screens/history/history.dart';
import 'package:get/instance_manager.dart';

import '../home/home_controller.dart';
import 'navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(History(), permanent: true);
  }
}
