import 'package:daily_budget/screens/login/login_binding.dart';
import 'package:daily_budget/screens/sign_up/sign_up.dart';
import 'package:daily_budget/screens/sign_up/sign_up_binding.dart';
import 'package:get/route_manager.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/navigation/navigation.dart';
import '../screens/navigation/navigation_bindinig.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.loginScreen, page: () => Login(), binding: LoginBinding()),
    GetPage(
      name: Routes.homeScreen,
      page: () => Home(),
    ),
    GetPage(
        name: Routes.navigationScreen,
        page: () => Navigation(),
        binding: NavigationBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUp(),
        binding: SignUpBinding())
  ];
}
