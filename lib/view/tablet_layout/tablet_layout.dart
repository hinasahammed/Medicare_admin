import 'package:flutter/material.dart';
import 'package:medicare_admin/view/tablet_layout/login/login_view_tablet.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: LoginViewTablet(),
    );
  }
}
