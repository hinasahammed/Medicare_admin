import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/login/login_view_content.dart';
import 'package:medicare_admin/res/components/login/login_view_form.dart';

class LoginViewMobile extends StatelessWidget {
  const LoginViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.loginbg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: size.width < 600
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginViewContent(),
            if (size.width < 600) const Gap(20),
            const LoginViewForm(),
          ],
        ),
      ),
    );
  }
}
