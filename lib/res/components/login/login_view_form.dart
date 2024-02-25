import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/data/response/status.dart';
import 'package:medicare_admin/res/components/custom_button.dart';
import 'package:medicare_admin/res/components/custom_textformfield.dart';
import 'package:medicare_admin/viewModel/controller/admin_viewmodel.dart';
import 'package:flip_card/flip_card.dart';
import 'package:medicare_admin/viewModel/controller/doctor_viewmodel.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final adminViewModel = Get.put(AdminViewModel());
    final doctorViewModel = Get.put(DoctorViewModel());

    final theme = Theme.of(context);

    return Obx(
      () => Form(
        key: _formkey,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: FlipCard(
                  controller: adminViewModel.flipCardController,
                  front: Container(
                    padding: const EdgeInsets.all(12),
                    width: size.width < 600 || size.width < 850
                        ? size.width
                        : size.width * .3,
                    height: size.height * .6,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            adminViewModel.isAdmin.value ? 'Admin' : 'Doctor',
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Sign in',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(15),
                        CustomTextFormField(
                          textContentColor: Colors.white,
                          textColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter user name';
                            } else {
                              return null;
                            }
                          },
                          controller: adminViewModel.isAdmin.value
                              ? adminViewModel.userNameController.value
                              : doctorViewModel.doctorNameController.value,
                          labelText: 'User name',
                        ),
                        const Gap(15),
                        CustomTextFormField(
                          textContentColor: Colors.white,
                          textColor: Colors.white,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password';
                            } else {
                              return null;
                            }
                          },
                          controller: adminViewModel.isAdmin.value
                              ? adminViewModel.passwordController.value
                              : doctorViewModel.passwordController.value,
                          labelText: 'Password',
                        ),
                        const Gap(25),
                        CustomButton(
                          isLoading: adminViewModel.reqStatusResponse.value ==
                              Status.loading,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              adminViewModel.adminLogin(context);
                            }
                          },
                          btnText: 'Sign in',
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  back: Container(
                    padding: const EdgeInsets.all(12),
                    width: size.width < 600 ? size.width : size.width * .3,
                    height: size.height * .6,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            adminViewModel.isAdmin.value ? 'Admin' : 'Doctor',
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Sign in',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(15),
                        CustomTextFormField(
                          textContentColor: Colors.white,
                          textColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter user name';
                            } else {
                              return null;
                            }
                          },
                          controller: adminViewModel.isAdmin.value
                              ? adminViewModel.userNameController.value
                              : doctorViewModel.doctorNameController.value,
                          labelText: 'User name',
                        ),
                        const Gap(15),
                        CustomTextFormField(
                          textContentColor: Colors.white,
                          textColor: Colors.white,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password';
                            } else {
                              return null;
                            }
                          },
                          controller: adminViewModel.isAdmin.value
                              ? adminViewModel.passwordController.value
                              : doctorViewModel.passwordController.value,
                          labelText: 'Password',
                        ),
                        const Gap(25),
                        CustomButton(
                          isLoading: adminViewModel.isAdmin.value
                              ? adminViewModel.reqStatusResponse.value ==
                                  Status.loading
                              : doctorViewModel.reqStatusResponse.value ==
                                  Status.loading,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              adminViewModel.isAdmin.value
                                  ? adminViewModel.adminLogin(context)
                                  : doctorViewModel.doctorLogin(context);
                            }
                          },
                          btnText: 'Sign in',
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
