import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medicare_admin/res/components/custom_button.dart';
import 'package:medicare_admin/viewModel/login_view_model.dart';

class LoginViewContent extends StatelessWidget {
  const LoginViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final loginViewModel = Get.put(LoginViewModel());
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (size.width > 600)
          SizedBox(
            width: size.width * .45,
            child: Text(
              loginViewModel.isAdmin.value
                  ? "Welcome back to the Medicare Administration panel!"
                  : 'Welcome!',
              style: theme.textTheme.displayLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const Gap(20),
        if (size.width > 600)
          SizedBox(
            width: size.width * .45,
            child: Text(
              "You're at the helm of facilitating convenient healthcare access for countless users. Let's take a quick look at the current landscape",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: Colors.white.withOpacity(.7),
              ),
            ),
          ),
        const Gap(20),
        Row(
          children: [
            CustomButton(
              isIcon: true,
              icon: Icons.arrow_right_alt,
              onPressed: () {
                loginViewModel.isAdmin.value = true;
                loginViewModel.flipCardController.toggleCard();
              },
              btnText: 'As Admin',
            ),
            const Gap(15),
            CustomButton(
              isIcon: true,
              icon: Icons.arrow_right_alt,
              onPressed: () {
                loginViewModel.isAdmin.value = false;
                loginViewModel.flipCardController.toggleCard();
              },
              btnText: 'As Doctor',
            ),
          ],
        ),
      ],
    );
  }
}
