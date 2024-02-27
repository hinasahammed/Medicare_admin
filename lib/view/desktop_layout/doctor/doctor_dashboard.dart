import 'package:flutter/material.dart';
import 'package:medicare_admin/view/desktop_layout/doctor/dashboard/doctor_dashboard_left.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1A1D24),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: DoctorDashboardLeft(),
      ),
    );
  }
}
