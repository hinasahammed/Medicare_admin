import 'package:flutter/material.dart';
import 'package:medicare_admin/view/mobile_layout/login/login_view_mobile.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewMobile(),
    );
  }
}
