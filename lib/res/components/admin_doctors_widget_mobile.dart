import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/custom_textformfield.dart';
import 'package:medicare_admin/viewModel/services/admin_service.dart';

class AdminDoctorsWidgetMobile extends StatelessWidget {
  const AdminDoctorsWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Column(
        children: [
          const Gap(10),
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Card(
                  child: IconButton(
                    onPressed: () {
                      AdminService().pickImage();
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
              height: 320,
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
                    textContentColor: theme.colorScheme.primary,
                    textColor: Colors.black,
                    controller: TextEditingController(),
                    labelText: 'Name',
                  ),
                  const Gap(10),
                  CustomTextFormField(
                    textContentColor: theme.colorScheme.primary,
                    textColor: Colors.black,
                    controller: TextEditingController(),
                    labelText: 'Qualification',
                  ),
                  const Gap(10),
                  CustomTextFormField(
                    textContentColor: theme.colorScheme.primary,
                    textColor: Colors.black,
                    controller: TextEditingController(),
                    labelText: 'Working hour',
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          Card(
            child: Container(
              height: 280,
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
                  const DropdownMenu(
                    enableFilter: true,
                    hintText: 'Select type',
                    enableSearch: true,
                    dropdownMenuEntries: <DropdownMenuEntry<String>>[
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.cardio),
                        ),
                        value: 'Cardiology',
                        label: 'Cardiology',
                      ),
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.dermatology),
                        ),
                        value: 'Dermatology',
                        label: 'Dermatology',
                      ),
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.gastrology),
                        ),
                        value: 'Gastroenterology',
                        label: 'Gastroenterology',
                      ),
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.hematology),
                        ),
                        value: 'Hematology',
                        label: 'Hematology',
                      ),
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.nuerologist),
                        ),
                        value: 'Neurology',
                        label: 'Neurology',
                      ),
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.orthopeadic),
                        ),
                        value: 'Orthopedics',
                        label: 'Orthopedics',
                      ),
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.pediatrics),
                        ),
                        value: 'Pediatrics',
                        label: 'Pediatrics',
                      ),
                      DropdownMenuEntry(
                        leadingIcon: CircleAvatar(
                          backgroundImage: AssetImage(ImageAssets.psychiatry),
                        ),
                        value: 'Psychiatry',
                        label: 'Psychiatry',
                      ),
                    ],
                  ),
                  const Gap(10),
                  CustomTextFormField(
                    textContentColor: theme.colorScheme.primary,
                    textColor: Colors.black,
                    controller: TextEditingController(),
                    labelText: 'Fees',
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
