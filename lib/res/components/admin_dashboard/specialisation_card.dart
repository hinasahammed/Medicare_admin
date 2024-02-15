import 'package:flutter/material.dart';

class SpecialisationCard extends StatelessWidget {
  final String image;
  final String title;
  const SpecialisationCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
        title: Text(
          title,
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
