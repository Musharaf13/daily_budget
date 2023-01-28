import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  void onInit() {
    
    super.onInit();
    FlutterNativeSplash.remove();
  }
}
