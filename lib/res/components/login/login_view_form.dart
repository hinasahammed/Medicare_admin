import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/components/custom_button.dart';
import 'package:medicare_admin/res/components/custom_textformfield.dart';
import 'package:medicare_admin/res/routes/routes_name.dart';
import 'package:medicare_admin/viewModel/login_view_model.dart';
import 'package:flip_card/flip_card.dart';

class LoginViewForm extends StatelessWidget {
  const LoginViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final loginViewModel = Get.put(LoginViewModel());

    final theme = Theme.of(context);

    return Obx(
      () => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: FlipCard(
                controller: loginViewModel.flipCardController,
                front: Container(
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
                          loginViewModel.isAdmin.value ? 'Admin' : 'Doctor',
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
                        validator: (value) {
                          return null;
                        },
                        controller: loginViewModel.userNameController.value,
                        labelText: 'User name',
                      ),
                      const Gap(15),
                      CustomTextFormField(
                        obscureText: true,
                        validator: (value) {
                          return null;
                        },
                        controller: loginViewModel.passwordController.value,
                        labelText: 'Password',
                      ),
                      const Gap(25),
                      CustomButton(
                        onPressed: () {
                          Get.toNamed(RoutesName.navigationBar);
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
                          loginViewModel.isAdmin.value ? 'Admin' : 'Doctor',
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
                        validator: (value) {
                          return null;
                        },
                        controller: loginViewModel.userNameController.value,
                        labelText: 'User name',
                      ),
                      const Gap(15),
                      CustomTextFormField(
                        obscureText: true,
                        validator: (value) {
                          return null;
                        },
                        controller: loginViewModel.passwordController.value,
                        labelText: 'Password',
                      ),
                      const Gap(25),
                      CustomButton(
                        onPressed: () {},
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
    );
  }
}
