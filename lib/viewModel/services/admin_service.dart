import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicare_admin/res/components/add_doctors_widget.dart';
import 'package:medicare_admin/res/components/admin_doctors_widget_mobile.dart';
import 'package:medicare_admin/utils/utils.dart';
import 'package:medicare_admin/viewModel/controller/admin_viewmodel.dart';

class AdminService {
  final adminViewModel = Get.put(AdminViewModel());

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

  void pickImage(BuildContext context) async {
    final imagePick = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (imagePick == null) {
      if (context.mounted) {
        return Utils.shownotif(
          'Pick image',
          'You have to pick an image',
          context,
          ContentType.warning,
        );
      }
    }

    final imageTemp = File(imagePick!.path);

    adminViewModel.selectedImage.value = imageTemp;
  }
}
