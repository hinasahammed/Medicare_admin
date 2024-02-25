import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Utils {
  static void showSnackbar(String title, String message) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
    );
  }

  static void shownotif(String title, String message, BuildContext context,
      ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showDialog(
    BuildContext context,
    void Function()? btnOkOnPress,
    DialogType dialogType,
    String title,
    String desc,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {
        Get.back();
      },
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}
