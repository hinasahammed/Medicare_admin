import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/view/desktop_layout/doctor/dashboard/doctor_dashboard_left.dart';
import 'package:medicare_admin/view/desktop_layout/doctor/dashboard/doctor_dashboard_right.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1A1D24),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: DoctorDashboardLeft(),
            ),
            Gap(10),
            Expanded(
              flex: 1,
              child: DoctorDashboardRight(),
            ),
          ],
        ),
      ),
    );
  }
}
