import 'package:daily_budget/screens/history/history.dart';
import 'package:daily_budget/screens/home/home.dart';
import 'package:daily_budget/screens/navigation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Navigation extends GetView<NavigationController> {
  const Navigation({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    History(),
    Text(
      'Index 2: School',
      // style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<NavigationController>(
              builder: (_) => _widgetOptions[controller.selectedIndex]),
          bottomNavigationBar: GetBuilder<NavigationController>(
              builder: (_) => BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.history),
                        label: 'History',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Setting',
                      ),
                    ],
                    currentIndex: controller.selectedIndex,
                    selectedItemColor: Colors.cyan,
                    onTap: controller.navigateScreen,
                  ))),
    );
  }
}
