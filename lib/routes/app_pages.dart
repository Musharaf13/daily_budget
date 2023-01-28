import 'package:daily_budget/screens/login/login_binding.dart';
import 'package:get/route_manager.dart';

import '../screens/home/home.dart';
import '../screens/home/home_binding.dart';
import '../screens/login/login.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.loginScreen, page: () => Login(), binding: LoginBinding()),
    GetPage(
        name: Routes.homeScreen, page: () => Home(), binding: HomeBinding()),
  ];
}
