import 'package:flutter/material.dart';
import 'package:medicare_admin/res/assets/image_assets.dart';
import 'package:medicare_admin/res/components/admin_dashboard/specialisation_card.dart';

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
          height: size.height * .7,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            children: [
              SpecialisationCard(
                image: ImageAssets.cardio,
                title: 'Cardiology',
              ),
              SpecialisationCard(
                image: ImageAssets.dermatology,
                title: 'Dermatology',
              ),
              SpecialisationCard(
                image: ImageAssets.gastrology,
                title: 'Gastroenterology',
              ),
              SpecialisationCard(
                image: ImageAssets.hematology,
                title: 'Hematology',
              ),
              SpecialisationCard(
                image: ImageAssets.nuerologist,
                title: 'Neurology',
              ),
              SpecialisationCard(
                image: ImageAssets.pediatrics,
                title: 'Pediatrics',
              ),
              SpecialisationCard(
                image: ImageAssets.psychiatry,
                title: 'Psychiatry',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
