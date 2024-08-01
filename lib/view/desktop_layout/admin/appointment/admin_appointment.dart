import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdminAppointment extends StatelessWidget {
  const AdminAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffF2F7FF),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appointments',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(15),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.event,
                          size: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Appointments',
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(.6),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '10',
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  'Today',
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(.4),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const VerticalDivider(),
                    Row(
                      children: [
                        const Icon(
                          Icons.warning,
                          size: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Urgent',
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(.6),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '10',
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  'Today',
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(.4),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const VerticalDivider(),
                    Row(
                      children: [
                        const Icon(
                          Icons.cancel,
                          size: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cancelled',
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(.6),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '10',
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  'Today',
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(.4),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const VerticalDivider(),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Completed',
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(.6),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '10',
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  'Today',
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(.4),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
