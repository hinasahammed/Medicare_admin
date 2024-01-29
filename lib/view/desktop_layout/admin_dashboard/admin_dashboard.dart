import 'package:flutter/material.dart';
import 'package:medicare_admin/res/components/admin_dashboard/dashboard_left_ui.dart';
import 'package:medicare_admin/res/components/admin_dashboard/dashboard_right_ui.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F7FF),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DashboardLeftUi(),
            DashboardRightUi(),
          ],
        ),
      ),
    );
  }
}
