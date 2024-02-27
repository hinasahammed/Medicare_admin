import 'package:flutter/material.dart';
import 'package:medicare_admin/res/assets/icons/icons_asset.dart';
import 'package:medicare_admin/res/components/admin_dashboard/specialisation_card.dart';

class AdminDashboardRightUi extends StatelessWidget {
  const AdminDashboardRightUi({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            children: [
              SpecialisationCard(
                image: IconsAsset.cardio,
                title: 'Cardiology',
              ),
              SpecialisationCard(
                image: IconsAsset.dermatology,
                title: 'Dermatology',
              ),
              SpecialisationCard(
                image: IconsAsset.gastrology,
                title: 'Gastroenterology',
              ),
              SpecialisationCard(
                image: IconsAsset.hematology,
                title: 'Hematology',
              ),
              SpecialisationCard(
                image: IconsAsset.nuerologist,
                title: 'Neurology',
              ),
              SpecialisationCard(
                image: IconsAsset.pediatrics,
                title: 'Pediatrics',
              ),
              SpecialisationCard(
                image: IconsAsset.psychiatry,
                title: 'Psychiatry',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
