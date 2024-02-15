import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicare_admin/res/components/add_doctors_widget.dart';
import 'package:medicare_admin/res/components/admin_doctors_widget_mobile.dart';
import 'package:medicare_admin/utils/utils.dart';
import 'package:medicare_admin/viewModel/controller/doctor_controller.dart';

class AdminService {
  final doctorViewModel = Get.put(DoctorViewModel());

  static void addDoctor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Card(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          content: const AddDoctorsWidget(),
        );
      },
    );
  }

  static void addDoctorSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => const AdminDoctorsWidgetMobile(),
    );
  }

  void pickImage() async {
    final imagePick = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (imagePick == null) {
      return Utils.showSnackbar('Pick image', 'You have to pick an image');
    }

    final imageTemp = File(imagePick.path);

    doctorViewModel.selectedImage.value = imageTemp;
  }
}
