import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/res/components/admin_dashboard/dashboard_total_container.dart';

class DashboardLeftUi extends StatelessWidget {
  const DashboardLeftUi({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final theme = Theme.of(context);
    return SizedBox(
      width: size.width * .55,
      child: Column(
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardTotalContainer(
                color: Color(0xffFFA900),
                title: 'Total\n Doctors',
                count: '10',
              ),
              DashboardTotalContainer(
                color: Color(0xff796EFF),
                title: 'Total\n Appointments',
                count: '30',
              ),
              DashboardTotalContainer(
                color: Color(0xffFF5263),
                title: 'Total\n Patients',
                count: '30',
              ),
            ],
          ),
          const Gap(15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest Appointments',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'No:',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      Text(
                        'Date',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      Text(
                        'Name',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      Text(
                        'Age',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      Text(
                        'Country',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      Text(
                        'Gender',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                      Text(
                        'Settings',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                    ],
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
