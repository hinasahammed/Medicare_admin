import 'package:flutter/material.dart';
import 'package:medicare_admin/view/desktop_layout/login/login_view_desktop.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewDesktop(),
    );
  }
}
