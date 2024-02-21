import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/models/doctor_model/doctor_model.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/viewModel/controller/doctor_controller.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctorList;
  const DoctorCard({super.key, required this.doctorList});

  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Get.put(DoctorViewModel());
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: Container(
            height: size.height * .3,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: doctorList.imageUrl == null
                            ? const NetworkImage(
                                'https://i.pinimg.com/564x/2f/59/ef/2f59ef743fdb9bfcf7f0a21b63a00f7e.jpg')
                            : NetworkImage(doctorList.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorList.name!.toUpperCase(),
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          doctorList.specialization ?? '',
                          style: theme.textTheme.titleLarge!.copyWith(),
                        ),
                        Text(
                          doctorList.qualification ?? '',
                          style: theme.textTheme.titleLarge!.copyWith(),
                        ),
                        Text(
                          doctorList.workingHours ?? '',
                          style: theme.textTheme.titleLarge!.copyWith(),
                        ),
                        if (size.width <= 400) const Gap(20),
                        if (size.width <= 400)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  doctorViewModel
                                      .deleteDoctor(doctorList.name ?? '');
                                },
                                child: SizedBox(
                                  width: size.width * .08,
                                  child: Image.asset(
                                    ImageAssets.deleteButton,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * .08,
                                child: Image.asset(
                                  ImageAssets.editButton,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Transform.scale(
                                scale: .8, // Adjust the scale factor as needed
                                child: Switch(
                                  value: doctorList.isAvailable ?? true,
                                  onChanged: (newValue) {
                                    doctorViewModel.updateAvailability(
                                      doctorList.name ?? '',
                                      newValue,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            alignment: Alignment.center,
            width: size.width * .1,
            height: size.height * .05,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Text(
              '₹${doctorList.fees.toString()}',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        if (size.width >= 400)
          Positioned(
            right: 5,
            top: 60,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    doctorViewModel.deleteDoctor(doctorList.name ?? '');
                  },
                  child: SizedBox(
                    width: size.width * .032,
                    child: Image.asset(
                      ImageAssets.deleteButton,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(10),
                SizedBox(
                  width: size.width * .032,
                  child: Image.asset(
                    ImageAssets.editButton,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(10),
                Transform.scale(
                  scale: .8, // Adjust the scale factor as needed
                  child: Switch(
                    value: doctorList.isAvailable ?? true,
                    onChanged: (newValue) {
                      doctorViewModel.updateAvailability(
                        doctorList.name ?? '',
                        newValue,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
