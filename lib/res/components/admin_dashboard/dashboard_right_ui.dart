import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class DashboardRightUi extends StatelessWidget {
  const DashboardRightUi({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Doctor's Appointment",
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: size.width * .2,
          height: size.height * .3,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.dashboard),
                      const Gap(5),
                      Column(
                        children: [
                          Text(
                            'Heart Surgeon',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.secondary,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.dashboard),
                      const Gap(5),
                      Column(
                        children: [
                          Text(
                            'Heart Surgeon',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.secondary,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
