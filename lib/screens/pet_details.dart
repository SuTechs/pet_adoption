import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/owner_info_card.dart';
import '../widgets/pet_deatils_info_card.dart';
import '../widgets/pet_grid_list.dart';

class PetDetailsScreen extends StatelessWidget {
  final PetData pet;

  const PetDetailsScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPinkishColor,
      body: CustomScrollView(
        slivers: [
          // pet image
          SliverAppBar(
            forceMaterialTransparency: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                pet.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: kPrimaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // pet details
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  /// indicator
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      color: kGreyTextColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),

                  /// pet details info
                  PetDetailsInfoCard(pet: pet),
                  const SizedBox(height: 32),

                  /// Owner Info Card
                  const OwnerInfoCard(),
                  const SizedBox(height: 8),

                  /// description
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      kDummyDescription,
                      style: TextStyle(
                        color: kGreyTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 48,
        decoration: BoxDecoration(
          gradient: kLinearGradient,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Center(
          child: Text(
            'ADOPT NOW',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
