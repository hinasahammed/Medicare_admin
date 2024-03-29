import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    final pref = await SharedPreferences.getInstance();
    var admintoken = pref.getString('Admin_Login_token');
    var doctortoken = pref.getString('doctor_token');

    if (admintoken != null) {
      Get.offAllNamed(
        RoutesName.adminNavigationBar,
      );
    } else if (doctortoken != null) {
      Get.offAllNamed(
        RoutesName.doctorNavigationBar,
      );
    } else {
      Get.offAllNamed(
        RoutesName.responsiveLayout,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
