import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/data/response/status.dart';
import 'package:medicare_admin/viewModel/controller/doctor_controller.dart';
import 'package:medicare_admin/viewModel/services/admin_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final doctorViewModel = Get.put(DoctorViewModel());
    final crossAxisCount = size.width > 690 ? 4 : 2;

    final cardWidth =
        (size.width - ((crossAxisCount + 1) * 10)) / crossAxisCount;

    Future<void> setRefresh() async {
      print('hello');
    }

    return Scaffold(
      backgroundColor: const Color(0xffF2F7FF),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: LiquidPullToRefresh(
          onRefresh: setRefresh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Doctors',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
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
              const Gap(10),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: doctorViewModel.allDoctorsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: cardWidth / 320,
                  ),
                  itemBuilder: (context, index) {
                    final list = doctorViewModel.allDoctorsList[index];
                    if (doctorViewModel.reqStatusResponse.value ==
                        Status.loading) {
                      return CircularProgressIndicator(
                        color: theme.colorScheme.primary,
                      );
                    }
                    if (doctorViewModel.allDoctorsList.isEmpty ||
                        doctorViewModel.allDoctorsList == []) {
                      return Center(
                        child: Text(
                          'No doctors found!',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      );
                    } else {
                      return Card(
                        child: Container(
                          width: cardWidth,
                          height: 320,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: cardWidth,
                                height: Get.height * .2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: list.imageUrl != null
                                        ? NetworkImage(list.imageUrl!)
                                        : const NetworkImage(
                                            'https://i.pinimg.com/564x/80/f6/ce/80f6ce7b8828349aa277cf3bcb19c477.jpg',
                                          ),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Text(
                                list.name!.toUpperCase(),
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                list.specialization ?? '',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.onBackground
                                      .withOpacity(.4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${list.qualification}',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.onBackground
                                          .withOpacity(.4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '₹${list.fees.toString()}',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.onBackground
                                          .withOpacity(.4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                list.workingHours ?? '',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.onBackground
                                      .withOpacity(.4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ), // scroll view
        ),
      ),
    );
  }
}
