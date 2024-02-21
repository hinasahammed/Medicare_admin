import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/data/response/status.dart';
import 'package:medicare_admin/res/repository/admin_repository.dart';
import 'package:medicare_admin/res/routes/routes_name.dart';
import 'package:medicare_admin/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminViewModel extends GetxController {
  RxBool isAdmin = true.obs;
  late FlipCardController flipCardController;
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final userNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final _repo = AdminRepository();

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void adminLogin() async {
    setReqStatusResponse(Status.loading);
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      "username": userNameController.value.text.trim(),
      "password": passwordController.value.text.trim(),
    };

    _repo.adminAuth(data).then((value) {
      setReqStatusResponse(Status.completed);
      if (value['success'] == true) {
        pref
            .setString(
          'Admin_Login_token',
          value['token'],
        )
            .then((value) {
          Get.offAllNamed(
            RoutesName.navigationBar,
          );
        });
      }
      if (value['success'] == false) {
        Utils.showSnackbar('Oops', 'Invalid Credentials');
      }
    }).onError((error, stackTrace) {
      setReqStatusResponse(Status.error);
      if (kDebugMode) {
        print(error);
      }
    });
  }

  void adminLogout() async {
    final pref = await SharedPreferences.getInstance();
    Get.offAllNamed(
      RoutesName.responsiveLayout,
    );
    pref.remove('Admin_Login_token');
  }

  @override
  void onInit() {
    super.onInit();
    flipCardController = FlipCardController();
  }
}
