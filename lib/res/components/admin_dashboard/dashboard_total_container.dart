import 'package:flutter/material.dart';

class DashboardTotalContainer extends StatelessWidget {
  final Color color;
  final String title;
  final String count;
  const DashboardTotalContainer(
      {super.key,
      required this.color,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(.5),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            count,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
