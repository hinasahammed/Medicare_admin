import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/web_navigation_bar.dart';
import 'package:medicare_admin/view/desktop_layout/admin_dashboard/admin_dashboard.dart';
import 'package:medicare_admin/view/desktop_layout/appointment/admin_appointment.dart';
import 'package:medicare_admin/view/desktop_layout/doctors/all_doctors.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: size.width < 600 || size.width > 500 && size.width < 850
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
