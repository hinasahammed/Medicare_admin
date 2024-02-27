import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/res/assets/images/image_assets.dart';
import 'package:medicare_admin/res/components/navigation_items_widget.dart';

class WebNavigationBar extends StatelessWidget {
  const WebNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final theme = Theme.of(context);
    return Container(
      width: size.width * .19,
      height: size.height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.logo),
              ),
              const Gap(10),
              Text(
                'Medicare',
                style: theme.textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const Gap(20),
          const NavigationItemsWidget(
            title: 'Dashboard',
            icon: Icons.dashboard,
          ),
          const Gap(15),
          const NavigationItemsWidget(
            title: 'Appointments',
            icon: Icons.event,
          ),
          const Gap(15),
          const NavigationItemsWidget(
            title: 'Doctors',
            icon: Icons.local_hospital,
          ),
          const Gap(15),
          const NavigationItemsWidget(
            title: 'Users',
            icon: Icons.account_circle,
          ),
          const Gap(15),
          const NavigationItemsWidget(
            title: 'Settings',
            icon: Icons.settings,
          ),
          const Gap(15),
          const NavigationItemsWidget(
            title: 'Calendar',
            icon: Icons.calendar_month,
          ),
          const Spacer(),
          const NavigationItemsWidget(
            title: 'Logout',
            icon: Icons.logout,
          ),
          const Gap(15),
        ],
      ),
    );
  }
}
