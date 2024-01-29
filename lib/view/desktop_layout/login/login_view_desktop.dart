import 'package:flutter/material.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/login/login_view_content.dart';
import 'package:medicare_admin/res/components/login/login_view_form.dart';

class LoginViewDesktop extends StatelessWidget {
  const LoginViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              LoginViewContent(),
              Spacer(),
              LoginViewForm(),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
