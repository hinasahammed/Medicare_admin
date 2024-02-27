import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/assets/icons/icons_asset.dart';
import 'package:medicare_admin/res/assets/images/image_assets.dart';
import 'package:medicare_admin/res/components/doctor_dashboard_top_container.dart';
import 'package:medicare_admin/viewModel/controller/doctor_viewmodel.dart';

class DoctorDashboardLeft extends StatelessWidget {
  const DoctorDashboardLeft({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final doctorData = Get.put(DoctorViewModel());
    return Obx(() {
      var doctor = doctorData.doctorData.value;

      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome ${doctor.name ?? ''}!',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'You have 7 patients remaining today',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: Colors.white.withOpacity(.6),
              ),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: DoctorDashboardTopContainer(
                    color: const Color(0xff796EFF),
                    secondColor: const Color.fromARGB(255, 235, 234, 249)
                        .withOpacity(.6),
                    imageUrl: IconsAsset.appointments,
                    count: '30',
                    title: 'Appointments',
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: DoctorDashboardTopContainer(
                    color: const Color(0xff44B678),
                    secondColor: const Color.fromARGB(255, 221, 250, 234)
                        .withOpacity(.6),
                    imageUrl: IconsAsset.appointmentsCompleted,
                    count: '25',
                    title: 'Completed',
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: DoctorDashboardTopContainer(
                    color: const Color(0xffFFA900),
                    secondColor: const Color.fromARGB(255, 252, 231, 189)
                        .withOpacity(.6),
                    imageUrl: IconsAsset.appointmentsCancelled,
                    count: '1',
                    title: 'Cancelled',
                  ),
                ),
              ],
            ),
            const Gap(10),
            Text(
              "Today's Appointment",
              style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(
                    0xff242831,
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      'Tory browning',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(ImageAssets.doctorImage),
                    ),
                    subtitle: Text(
                      'Emergency',
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
