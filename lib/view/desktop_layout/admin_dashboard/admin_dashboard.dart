import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/components/admin_dashboard/dashboard_left_ui.dart';
import 'package:medicare_admin/res/components/admin_dashboard/dashboard_right_ui.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffF2F7FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: size.width > 500 && size.width < 890
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.width < 1360
                          ? size.height * .8
                          : size.height * .6,
                      child: const DashboardLeftUi(),
                    ),
                    const Gap(20),
                    SizedBox(
                      width: Get.width,
                      height: Get.height * .6,
                      child: const DashboardRightUi(),
                    ),
                  ],
                ),
              )
            : const Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: DashboardLeftUi(),
                  ),
                  Gap(10),
                  Expanded(
                    flex: 1,
                    child: DashboardRightUi(),
                  ),
                ],
              ),
      ),
    );
  }
}
