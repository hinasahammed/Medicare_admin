import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/data/response/status.dart';
import 'package:medicare_admin/models/all_doctor_model/doctor_model.dart';
import 'package:medicare_admin/res/repository/doctor_repository.dart';
import 'package:medicare_admin/res/routes/routes_name.dart';
import 'package:medicare_admin/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorViewModel extends GetxController {
  final _repo = DoctorRepository();
  Rx<Status> reqStatusResponse = Status.completed.obs;

  final doctorNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final doctorData = DoctorModel().obs;

  void setReqStatusResponse(Status status) {
    reqStatusResponse.value = status;
  }

  void doctorLogin(BuildContext context) async {
    var data = {
      "username": doctorNameController.value.text,
      "password": passwordController.value.text,
    };
    final pref = await SharedPreferences.getInstance();
    setReqStatusResponse(Status.loading);
    await _repo.doctorAuth(data).then((value) {
      if (value['message'] == 'Doctor not found') {
        Utils.shownotif(
          'Oops',
          'You are not part of us.',
          context,
          ContentType.failure,
        );
      } else {
        pref.setString(
          'doctor_token',
          value['token'],
        );
        pref.setString(
          'doctor_name',
          doctorNameController.value.text,
        );
        Get.offAllNamed(RoutesName.doctorNavigationBar);
      }

      setReqStatusResponse(Status.completed);
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

  void doctorLogout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('doctor_token');
    await pref.remove('doctor_name');
    Get.offAllNamed(
      RoutesName.responsiveLayout,
    );
  }

  void getDoctorData(
    BuildContext context,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var doctorName = pref.getString('doctor_name');
    setReqStatusResponse(Status.loading);
    await _repo.getDoctorData(doctorName ?? '').then((value) {
      setReqStatusResponse(Status.completed);
      doctorData.value = DoctorModel.fromJson(value['doctorWithImageURL']);
    }).onError((error, stackTrace) {
      setReqStatusResponse(Status.error);

      Utils.shownotif(
        'Oops',
        'Something went wrong',
        context,
        ContentType.failure,
      );
    });
  }
}
