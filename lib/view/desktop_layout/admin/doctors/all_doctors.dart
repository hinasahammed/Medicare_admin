import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/components/all_doctor_card.dart';
import 'package:medicare_admin/viewModel/controller/admin_viewmodel.dart';
import 'package:medicare_admin/viewModel/services/admin_service.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final adminViewModel = Get.put(AdminViewModel());

    return Scaffold(
      backgroundColor: const Color(0xffF2F7FF),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Doctors',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    size.width >= 765
                        ? AdminService.addDoctor(context)
                        : AdminService.addDoctorSheet(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Doctor'),
                ),
                const Gap(20),
                Expanded(
                  child: SearchBar(
                    controller: adminViewModel.searchController.value,
                    hintText: 'Search',
                    trailing: const [
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            const Expanded(
              child: AllDoctorcard(),
            )
          ],
        ),
      ),
    );
  }
}
