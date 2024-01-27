import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NavigationItemsWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const NavigationItemsWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          color: theme.colorScheme.onPrimary.withOpacity(.6),
        ),
        const Gap(15),
        Text(
          title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onPrimary.withOpacity(.6),
          ),
        )
      ],
    );
  }
}
