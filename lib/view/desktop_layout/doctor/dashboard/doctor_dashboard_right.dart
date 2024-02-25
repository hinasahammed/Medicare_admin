import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';

class DoctorDashboardRight extends StatelessWidget {
  const DoctorDashboardRight({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(
              0xff242831,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Gap(10),
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(ImageAssets.doctorImage),
              ),
              Text(
                'Dr. Mary grey',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'Nuerologist',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white.withOpacity(.6),
                ),
              ),
              const Gap(10),
              Text(
                'Nuerologist',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(
              0xff242831,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Analytics',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Gap(10),
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://wcs.smartdraw.com/chart/img/basic-bar-graph.png?bn=15100111907'),
              )
            ],
          ),
        )
      ],
    );
  }
}
