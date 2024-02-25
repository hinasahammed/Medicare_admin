import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/data/response/status.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/custom_button.dart';
import 'package:medicare_admin/res/components/custom_textformfield.dart';
import 'package:medicare_admin/viewModel/controller/admin_viewmodel.dart';
import 'package:medicare_admin/viewModel/services/admin_service.dart';

class AddDoctorsWidget extends StatefulWidget {
  const AddDoctorsWidget({super.key});

  @override
  State<AddDoctorsWidget> createState() => _AddDoctorsWidgetState();
}

class _AddDoctorsWidgetState extends State<AddDoctorsWidget> {
  final _formKey = GlobalKey<FormState>();
  final adminViewModel = Get.put(AdminViewModel());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Obx(
      () => SizedBox(
        width: size.width * .95,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Doctor',
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width * .18,
                              height: size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: adminViewModel
                                              .selectedImage.value.path ==
                                          ''
                                      ? const AssetImage(
                                          'assets/images/default_image.png',
                                        )
                                      : FileImage(
                                          adminViewModel.selectedImage.value,
                                        ) as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: Card(
                                child: IconButton(
                                  onPressed: () {
                                    AdminService().pickImage(context);
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Card(
                          child: Container(
                            height: 200,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'General information',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(10),
                                DropdownMenu(
                                  onSelected: (value) {
                                    if (value != null) {
                                      adminViewModel.specialization.value =
                                          value;
                                    }
                                  },
                                  enableFilter: true,
                                  hintText: 'Select type',
                                  enableSearch: true,
                                  dropdownMenuEntries: const <DropdownMenuEntry<
                                      String>>[
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.cardio),
                                      ),
                                      value: 'Cardiology',
                                      label: 'Cardiology',
                                    ),
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.dermatology),
                                      ),
                                      value: 'Dermatology',
                                      label: 'Dermatology',
                                    ),
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.gastrology),
                                      ),
                                      value: 'Gastroenterology',
                                      label: 'Gastroenterology',
                                    ),
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.hematology),
                                      ),
                                      value: 'Hematology',
                                      label: 'Hematology',
                                    ),
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.nuerologist),
                                      ),
                                      value: 'Neurology',
                                      label: 'Neurology',
                                    ),
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.orthopeadic),
                                      ),
                                      value: 'Orthopedics',
                                      label: 'Orthopedics',
                                    ),
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.pediatrics),
                                      ),
                                      value: 'Pediatrics',
                                      label: 'Pediatrics',
                                    ),
                                    DropdownMenuEntry(
                                      leadingIcon: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImageAssets.psychiatry),
                                      ),
                                      value: 'Psychiatry',
                                      label: 'Psychiatry',
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                CustomTextFormField(
                                  keyBoardtype: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Fees is empty';
                                    }
                                    return null;
                                  },
                                  textContentColor: theme.colorScheme.primary,
                                  textColor: Colors.black,
                                  controller:
                                      adminViewModel.feesController.value,
                                  labelText: 'Fees',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      children: [
                        Card(
                          child: Container(
                            height: size.height * .35,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Personal information',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(10),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Name is empty';
                                    }
                                    return null;
                                  },
                                  textContentColor: theme.colorScheme.primary,
                                  textColor: Colors.black,
                                  controller:
                                      adminViewModel.doctorNameController.value,
                                  labelText: 'Name',
                                ),
                                const Gap(10),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Qualification is empty';
                                    }
                                    return null;
                                  },
                                  textContentColor: theme.colorScheme.primary,
                                  textColor: Colors.black,
                                  controller: adminViewModel
                                      .qualificationController.value,
                                  labelText: 'Qualification',
                                ),
                                const Gap(10),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Working hour is empty';
                                    }
                                    return null;
                                  },
                                  textContentColor: theme.colorScheme.primary,
                                  textColor: Colors.black,
                                  controller: adminViewModel
                                      .workingHourController.value,
                                  labelText: 'Working hour',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        Card(
                          child: Container(
                            height: size.height * .25,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Credential',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(10),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'User name is empty';
                                    }
                                    return null;
                                  },
                                  textContentColor: theme.colorScheme.primary,
                                  textColor: Colors.black,
                                  controller:
                                      adminViewModel.userNameController.value,
                                  labelText: 'User name',
                                ),
                                const Gap(10),
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Qualification is empty';
                                    }
                                    return null;
                                  },
                                  textContentColor: theme.colorScheme.primary,
                                  textColor: Colors.black,
                                  controller:
                                      adminViewModel.passwordController.value,
                                  labelText: 'Password',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomButton(
                  isLoading:
                      adminViewModel.reqStatusResponse.value == Status.loading,
                  onPressed: () {
                    if (adminViewModel.specialization.value != '' ||
                        adminViewModel.specialization.value.isNotEmpty) {
                      if (_formKey.currentState!.validate()) {
                        adminViewModel.addDoctorData(context);
                      }
                    }
                  },
                  btnText: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
