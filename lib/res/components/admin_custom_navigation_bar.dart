import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/web_navigation_bar.dart';
import 'package:medicare_admin/utils/utils.dart';
import 'package:medicare_admin/view/desktop_layout/admin/admin_dashboard/admin_dashboard.dart';
import 'package:medicare_admin/view/desktop_layout/admin/appointment/admin_appointment.dart';
import 'package:medicare_admin/view/desktop_layout/admin/doctors/all_doctors.dart';
import 'package:medicare_admin/viewModel/controller/admin_viewmodel.dart';

class AdminCustomNavigationBar extends StatefulWidget {
  const AdminCustomNavigationBar({super.key});

  @override
  State<AdminCustomNavigationBar> createState() =>
      _AdminCustomNavigationBarState();
}

class _AdminCustomNavigationBarState extends State<AdminCustomNavigationBar> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currenIndex = 0;
  List pages = [
    const AdminDashboard(),
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
  void initState() {
    super.initState();
    adminViewModel.getAllDoctor(context);
  }

  @override
  Widget build(BuildContext context) {
    final adminViewModel = Get.put(AdminViewModel());
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
              leading: const CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.logo),
              ),
              title: Text(
                'Medicare',
                style: theme.textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Utils.showDialog(
                      context,
                      () {
                        adminViewModel.adminLogout();
                      },
                      DialogType.question,
                      'Logout',
                      'Are you sure want to logout?',
                    );
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
      body: Row(
        children: [
          if (MediaQuery.sizeOf(context).width >= 600)
            NavigationRail(
              selectedIconTheme:
                  IconThemeData(color: theme.colorScheme.onPrimary),
              selectedLabelTextStyle: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
              unselectedLabelTextStyle: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(.6),
              ),
              indicatorColor: theme.colorScheme.primary,
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
