import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/data/response/status.dart';
import 'package:medicare_admin/res/components/doctor_card.dart';
import 'package:medicare_admin/viewModel/controller/doctor_controller.dart';

class AllDoctorcard extends StatelessWidget {
  const AllDoctorcard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final doctorViewModel = Get.put(DoctorViewModel());
    final size = MediaQuery.sizeOf(context);

    return Obx(() {
      if (doctorViewModel.reqStatusResponse.value == Status.loading) {
        return Center(
          child: CircularProgressIndicator(
            color: theme.colorScheme.primary,
          ),
        );
      }
      if (doctorViewModel.allDoctorsList.isEmpty) {
        return Center(
          child: Text(
            'No doctor data found',
            style: theme.textTheme.headlineLarge!.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        );
      } else {
        return size.width >= 1080
            ? GridView.builder(
                itemCount: doctorViewModel.allDoctorsList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 650,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (context, index) {
                  final list = doctorViewModel.allDoctorsList[index];
                  return DoctorCard(doctorList: list);
                },
              )
            : ListView.builder(
                itemCount: doctorViewModel.allDoctorsList.length,
                itemBuilder: (context, index) {
                  final list = doctorViewModel.allDoctorsList[index];
                  return DoctorCard(doctorList: list);
                },
              );
      }
    });
  }
}
