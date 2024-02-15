import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/components/admin_dashboard/dashboard_total_container.dart';
import 'package:medicare_admin/viewModel/controller/doctor_controller.dart';

class DashboardLeftUi extends StatelessWidget {
  const DashboardLeftUi({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final doctorViewModel = Get.put(DoctorViewModel());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardTotalContainer(
                color: const Color(0xffFFA900),
                title: 'Total\n Doctors',
                count: doctorViewModel.allDoctorsList.length.toString(),
              ),
              const Gap(10),
              const DashboardTotalContainer(
                color: Color(0xff796EFF),
                title: 'Total\n Appointments',
                count: '30',
              ),
              const Gap(10),
              if (size.width > 440)
                const DashboardTotalContainer(
                  color: Color(0xffFF5263),
                  title: 'Total\n Patients',
                  count: '30',
                ),
              const Gap(10),
            ],
          ),
          if (size.width > 350 && size.width < 440) const Gap(10),
          if (size.width > 350 && size.width < 440)
            const DashboardTotalContainer(
              color: Color(0xffFF5263),
              title: 'Total\n Patients',
              count: '30',
            ),
          const Gap(15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        size.width > 350 && size.width < 850
                            ? 'Today\'s\nAppointments'
                            : 'Today\'s Appointments',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: theme.textTheme.labelMedium!.copyWith(
                            color:
                                theme.colorScheme.onBackground.withOpacity(.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: const Text('Robert Fox'),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1534030347209-467a5b0ad3e6?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      ),
                      subtitle: Text(
                        '45 Male,12 april 9:30',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: const Text('Jennie'),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1481214110143-ed630356e1bb?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      subtitle: Text(
                        '45 Female,12 april 10:30',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
