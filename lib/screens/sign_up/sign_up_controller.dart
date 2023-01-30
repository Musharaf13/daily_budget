import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {
  int _selectedStep = 0;
  int get selectedStep => _selectedStep;
  set selectedStep(value) {
    _selectedStep = value;
    update();
  }
}
