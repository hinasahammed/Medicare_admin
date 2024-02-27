import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/data/response/status.dart';
import 'package:medicare_admin/models/all_doctor_model/doctor_model.dart';
import 'package:medicare_admin/res/app_url/app_url.dart';
import 'package:medicare_admin/res/repository/admin_repository.dart';
import 'package:medicare_admin/res/routes/routes_name.dart';
import 'package:medicare_admin/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AdminViewModel extends GetxController {
  RxBool isAdmin = true.obs;
  late FlipCardController flipCardController;
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final userNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final doctorNameController = TextEditingController().obs;
  final qualificationController = TextEditingController().obs;
  final workingHourController = TextEditingController().obs;
  final feesController = TextEditingController().obs;
  final searchController = TextEditingController().obs;
  Rx<File> selectedImage = File('').obs;
  RxString specialization = ''.obs;
  RxList<DoctorModel> allDoctorsList = <DoctorModel>[].obs;

  final _repo = AdminRepository();

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void adminLogin(BuildContext context) async {
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
            RoutesName.adminNavigationBar,
          );
        });
      }
      if (value['success'] == false) {
        Utils.shownotif(
            'Oops', 'Invalid Credentials', context, ContentType.failure);
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

  void getAllDoctor(BuildContext context) async {
    await _repo.getAllDoctorData().then((value) {
      allDoctorsList.clear();
      for (var element in value['doctors']) {
        allDoctorsList.add(DoctorModel.fromJson(element));
      }
    }).onError(
      (error, stackTrace) {
        setReqStatusResponse(Status.error);

        Utils.shownotif(
          'Oops',
          'Something went wrong',
          context,
          ContentType.failure,
        );
      },
    );
  }

  void addDoctorData(BuildContext context) async {
    setReqStatusResponse(Status.loading);

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.addDoctor));

    // Add the image file to the request
    var pic =
        await http.MultipartFile.fromPath('image', selectedImage.value.path);
    request.files.add(pic);

    // Add other form data to the request
    request.fields['name'] = doctorNameController.value.text;
    request.fields['qualification'] = qualificationController.value.text;
    request.fields['workingHours'] = workingHourController.value.text;
    request.fields['fees'] = feesController.value.text;
    request.fields['specialization'] = specialization.value;
    request.fields['username'] = userNameController.value.text;
    request.fields['password'] = passwordController.value.text;

    // Send the request
    var response = await request.send();

    // Check the response status
    if (response.statusCode == 200) {
      setReqStatusResponse(Status.completed);
      if (context.mounted) {
        getAllDoctor(context);
      }
      Get.back();
      selectedImage.value = File('');
      userNameController.value.clear();
      qualificationController.value.clear();
      workingHourController.value.clear();
      doctorNameController.value.clear();
      passwordController.value.clear();
      feesController.value.clear();
    } else {
      setReqStatusResponse(Status.error);
      if (context.mounted) {
        Utils.shownotif(
            'Oops', 'Something went wrong', context, ContentType.failure);
      }
    }
  }

  void updateAvailability(
      String name, bool isAvailable, BuildContext context) async {
    Map<String, dynamic> data = {
      "name": name,
      "isAvailable": isAvailable,
    };
    await _repo.changeDoctorAvailability(data).then((value) {
      getAllDoctor(context);
    }).onError((error, stackTrace) {
      Utils.shownotif('Oops', 'Something got problem when updating', context,
          ContentType.failure);
    });
  }

  void deleteDoctor(String doctorName, BuildContext context) async {
    await _repo.deleteDoctor(doctorName).then((value) {
      getAllDoctor(context);
    }).onError((error, stackTrace) {
      Utils.shownotif('Oops', 'Something got problem when deleting', context,
          ContentType.failure);
    });
  }

  @override
  void onInit() {
    super.onInit();
    flipCardController = FlipCardController();
  }
}
