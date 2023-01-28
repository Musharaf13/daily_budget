import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationController extends GetxController {
  
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    update();
  }

  void navigateScreen(int value) {
    selectedIndex = value;
  }
}
