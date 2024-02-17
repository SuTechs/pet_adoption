import 'package:flutter/material.dart';
import 'package:pet_adoption/constants.dart';
import 'package:pet_adoption/widgets/pet_category_tab_bar.dart';

import '../widgets/location_picker.dart';
import '../widgets/pet_grid_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Icon(
              Icons.menu_rounded,
              color: kBrownColor,
            ),
          ),
        ),
        title: const Text('Luka'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(kDummyProfilePicUrl),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// Location Picker
          const LocationPicker(),
          const SizedBox(height: 16),

          /// category
          PetCategoryTabBar(
            categories: CategoryData.categories,
            onTabChanged: (index) {},
          ),
          const SizedBox(height: 24),

          /// pet list
          const Expanded(
            child: PetGridList(
              pets: [...PetData.cats, ...PetData.cats],
            ),
          ),
        ],
      ),
    );
  }
}
