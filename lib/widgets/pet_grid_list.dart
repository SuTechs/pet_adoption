import 'package:flutter/material.dart';

/// Pet Grid List
class PetGridList extends StatelessWidget {
  final List<PetData> pets;

  const PetGridList({super.key, required this.pets});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pets.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 185 / 250,
      ),
      itemBuilder: (context, index) {
        return PetGridTile(
          pet: pets[index],
        );
      },
    );
  }
}

/// Pet Grid Tile
class PetGridTile extends StatelessWidget {
  final PetData pet;

  const PetGridTile({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: const LinearGradient(
          colors: [
            Colors.black12,
            Colors.black54,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage(pet.imageUrl),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // name
          Text(
            pet.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          // breed
          Text(
            pet.breed,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          // gender and age
          Row(
            children: [
              // gender icon
              Icon(
                pet.isGenderMale ? Icons.male : Icons.female,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                pet.isGenderMale ? 'Boy' : 'Girl',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.access_time_outlined,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                pet.age,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Pet Data Model
class PetData {
  final String name;
  final String imageUrl;
  final String breed;
  final String age;
  final bool isGenderMale;

  const PetData({
    required this.name,
    required this.imageUrl,
    required this.breed,
    required this.age,
    required this.isGenderMale,
  });

  static const cats = [
    PetData(
      name: 'Mia',
      breed: 'Burmilla',
      isGenderMale: false,
      age: '2 months',
      imageUrl: 'assets/images/cat1.png',
    ),
    PetData(
      name: 'Oliver',
      breed: 'Australian Mist',
      isGenderMale: true,
      age: '1 year',
      imageUrl: 'assets/images/cat2.png',
    ),
    PetData(
      name: 'Jerry',
      breed: 'Scottish Fold',
      isGenderMale: false,
      age: '2 year',
      imageUrl: 'assets/images/cat3.png',
    ),
    PetData(
      name: 'Milo',
      breed: 'American Curl',
      isGenderMale: false,
      age: '1 months',
      imageUrl: 'assets/images/cat4.png',
    ),
  ];
}
