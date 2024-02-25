import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/web_navigation_bar.dart';
import 'package:medicare_admin/utils/utils.dart';
import 'package:medicare_admin/view/desktop_layout/admin/appointment/admin_appointment.dart';
import 'package:medicare_admin/view/desktop_layout/admin/doctors/all_doctors.dart';
import 'package:medicare_admin/view/desktop_layout/doctor/doctor_dashboard.dart';
import 'package:medicare_admin/viewModel/controller/admin_viewmodel.dart';
import 'package:medicare_admin/viewModel/controller/doctor_viewmodel.dart';

class DoctorCustomNavigationBar extends StatefulWidget {
  const DoctorCustomNavigationBar({super.key});

  @override
  State<DoctorCustomNavigationBar> createState() =>
      _DoctorCustomNavigationBarState();
}

class _DoctorCustomNavigationBarState extends State<DoctorCustomNavigationBar> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currenIndex = 0;
  List pages = [
    const DoctorDashboard(),
    const AdminAppointment(),
    const AllDoctors(),
    Container(
      height: Get.height,
      color: Colors.purple,
      child: const Text('kfjd'),
    ),
  ];

  final adminViewModel = Get.put(AdminViewModel());

  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Get.put(DoctorViewModel());
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: size.width < 600 || size.width > 350 && size.width < 850
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : AppBar(
              backgroundColor: const Color(0xff22252F),
              leading: const CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.logo),
              ),
              title: Text(
                'Medicare',
                style: theme.textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Utils.showDialog(
                      context,
                      () {
                        doctorViewModel.doctorLogout();
                      },
                      DialogType.question,
                      'Logout',
                      'Are you sure want to logout?',
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
      body: Row(
        children: [
          if (MediaQuery.sizeOf(context).width >= 600)
            NavigationRail(
              backgroundColor: const Color(0xff21242E),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              selectedLabelTextStyle: theme.textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
              unselectedLabelTextStyle: theme.textTheme.titleLarge!.copyWith(
                color: Colors.white.withOpacity(.6),
              ),
              unselectedIconTheme: IconThemeData(
                color: Colors.white.withOpacity(.6),
              ),
              indicatorColor: const Color(0xff2BABE5),
              onDestinationSelected: (value) {
                setState(() {
                  currenIndex = value;
                });
              },
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard),
                  label: Text(
                    'Dashboard',
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.event_available),
                  label: Text(
                    'Appointments',
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.local_hospital),
                  label: Text(
                    'Doctors',
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle),
                  label: Text(
                    'Users',
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text(
                    'Settings',
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.calendar_month),
                  label: Text(
                    'Calendar',
                  ),
                ),
              ],
              selectedIndex: currenIndex,
            ),
          Expanded(
            child: pages[currenIndex],
          )
        ],
      ),
      drawer: MediaQuery.sizeOf(context).width < 600
          ? Drawer(
              width: size.width * .45,
              child: const WebNavigationBar(),
            )
          : null,
    );
  }
}
