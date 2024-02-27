import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/viewModel/controller/doctor_viewmodel.dart';

class DoctorDashboardRight extends StatelessWidget {
  const DoctorDashboardRight({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final doctorViewModel = Get.put(DoctorViewModel());

    return Obx(() {
      final doctor = doctorViewModel.doctorData.value;

      return Column(
        children: [
          Expanded(
            child: Container(
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
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: doctor.imageUrl == null
                        ? const NetworkImage(
                            'https://i.pinimg.com/564x/2f/59/ef/2f59ef743fdb9bfcf7f0a21b63a00f7e.jpg')
                        : NetworkImage(doctor.imageUrl!),
                  ),
                  Text(
                    'Dr. ${doctor.name ?? ''}'.toUpperCase(),
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    doctor.specialization ?? '',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: Colors.white.withOpacity(.6),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    doctor.qualification ?? '',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: Colors.white.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
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
                SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: const FlTitlesData(show: true),
                      maxY: 100,
                      minY: 0,
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                                toY: 15,
                                color: theme.colorScheme.primary,
                                width: 25,
                                borderRadius: BorderRadius.circular(4),
                                backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 100,
                                    color: theme.colorScheme.primary
                                        .withOpacity(.4))),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                                toY: 45,
                                color: theme.colorScheme.primary,
                                width: 25,
                                borderRadius: BorderRadius.circular(4),
                                backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 100,
                                    color: theme.colorScheme.primary
                                        .withOpacity(.4))),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                                toY: 30,
                                color: theme.colorScheme.primary,
                                width: 25,
                                borderRadius: BorderRadius.circular(4),
                                backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 100,
                                    color: theme.colorScheme.primary
                                        .withOpacity(.4))),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                                toY: 25,
                                color: theme.colorScheme.primary,
                                width: 25,
                                borderRadius: BorderRadius.circular(4),
                                backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 100,
                                    color: theme.colorScheme.primary
                                        .withOpacity(.4))),
                          ],
                        ),
                      ],
                    ),

                    swapAnimationDuration:
                        const Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
