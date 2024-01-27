import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  RxBool isAdmin = true.obs;
  late FlipCardController flipCardController;

  final userNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    flipCardController = FlipCardController();
  }
}
