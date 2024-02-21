import 'package:flutter/material.dart';
import 'package:medicare_admin/view/desktop_layout/desktop_layout.dart';
import 'package:medicare_admin/view/mobile_layout/mobile_layout.dart';
import 'package:medicare_admin/view/tablet_layout/tablet_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return const MobileLayout();
      } else if (constraints.maxWidth > 500 && constraints.maxWidth < 1100) {
        return const TabletLayout();
      } else {
        return const DesktopLayout();
      }
    });
  }
}
