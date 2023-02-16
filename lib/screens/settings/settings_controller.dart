import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SettingsController extends GetxController{
   final TextEditingController monthlyBudgetController = TextEditingController();
  final TextEditingController dailyBudgetController = TextEditingController();
  final TextEditingController workingDaysController = TextEditingController();
  final TextEditingController weekendsController = TextEditingController();
    final GlobalKey<FormState> budgetFormKey = GlobalKey<FormState>();

}