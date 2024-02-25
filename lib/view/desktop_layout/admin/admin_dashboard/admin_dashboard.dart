import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/res/components/admin_dashboard/admin_dashboard_left_ui.dart';
import 'package:medicare_admin/res/components/admin_dashboard/admin_dashboard_right_ui.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffF2F7FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: size.width > 350 && size.width < 890
            ? const SingleChildScrollView(
                child: Column(
                  children: [
                    AdminDashboardLeftUi(),
                    Gap(20),
                    AdminDashboardRightUi(),
                  ],
                ),
              )
            : const Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: AdminDashboardLeftUi(),
                  ),
                  Gap(10),
                  Expanded(
                    flex: 1,
                    child: AdminDashboardRightUi(),
                  ),
                ],
              ),
      ),
    );
  }
}
