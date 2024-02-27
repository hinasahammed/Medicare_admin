import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DoctorDashboardTopContainer extends StatelessWidget {
  final Color? color;
  final Color? secondColor;
  final String imageUrl;
  final String count;
  final String title;
  const DoctorDashboardTopContainer({
    super.key,
    required this.color,
    required this.secondColor, required this.imageUrl, required this.count, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * .1,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            width: size.width * .04,
            decoration: BoxDecoration(
              color: secondColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
