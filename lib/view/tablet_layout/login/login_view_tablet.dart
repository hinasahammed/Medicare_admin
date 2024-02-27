import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/res/assets/images/image_assets.dart';
import 'package:medicare_admin/res/components/login/login_view_content.dart';
import 'package:medicare_admin/res/components/login/login_view_form.dart';

class LoginViewTablet extends StatelessWidget {
  const LoginViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.loginbg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const LoginViewContent(),
              if (size.width < 600) const Gap(20),
              const LoginViewForm(),
            ],
          ),
        ),
      ),
    );
  }
}
