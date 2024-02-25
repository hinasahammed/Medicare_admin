import 'package:get/get.dart';
import 'package:medicare_admin/res/components/admin_custom_navigation_bar.dart';
import 'package:medicare_admin/res/components/doctor_custom_navigation_bar.dart';
import 'package:medicare_admin/res/components/responsive_layout.dart';
import 'package:medicare_admin/res/routes/routes_name.dart';
import 'package:medicare_admin/view/desktop_layout/admin/admin_dashboard/admin_dashboard.dart';
import 'package:medicare_admin/view/desktop_layout/desktop_layout.dart';
import 'package:medicare_admin/view/mobile_layout/mobile_layout.dart';
import 'package:medicare_admin/view/splash/splash_view.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splash,
          page: () => const SplashView(),
        ),
        GetPage(
          name: RoutesName.responsiveLayout,
          page: () => const ResponsiveLayout(),
        ),
        GetPage(
          name: RoutesName.desktopLayout,
          page: () => const DesktopLayout(),
        ),
        GetPage(
          name: RoutesName.mobileLayout,
          page: () => const MobileLayout(),
        ),
        GetPage(
          name: RoutesName.adminNavigationBar,
          page: () => const AdminCustomNavigationBar(),
        ),
        GetPage(
          name: RoutesName.doctorNavigationBar,
          page: () => const DoctorCustomNavigationBar(),
        ),
        GetPage(
          name: RoutesName.adminHome,
          page: () => const AdminDashboard(),
        ),
      ];
}
