import 'package:flutter/material.dart';
import 'package:pet_adoption/widgets/pet_grid_list.dart';

import '../constants.dart';

class CustomInfographic extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const CustomInfographic({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 32,
          width: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: kGreyTextColor,
                fontSize: 12,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: kBrownColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PetDetailsInfoCard extends StatelessWidget {
  final PetData pet;

  const PetDetailsInfoCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Pet basic info
        ListTile(
          /// name
          title: Text(pet.name),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBrownColor,
          ),

          /// location
          subtitle: const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: kGreyTextColor,
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                'Bengaluru (3.2km)',
                style: TextStyle(
                  color: kGreyTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          /// price
          trailing: const Text(
            '₹3,000',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 24,
            ),
          ),
        ),

        /// Pet more details
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// sex
              CustomInfographic(
                color: kPrimaryColor,
                title: 'Sex',
                value: 'Male',
              ),

              /// Age
              CustomInfographic(
                color: Color(0xffF78F8F),
                title: 'Age',
                value: '1 year',
              ),

              /// Weight
              CustomInfographic(
                color: Color(0xffF4D757),
                title: 'Weight',
                value: '2 kg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
