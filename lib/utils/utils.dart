import 'package:get/get.dart';

class Utils {
  static void showSnackbar(String title, String message) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
    );
  }
}
