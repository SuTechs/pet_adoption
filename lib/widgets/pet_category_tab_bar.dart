import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CategoryData {
  final String title;
  final String iconPath;

  const CategoryData({
    required this.title,
    required this.iconPath,
  });

  static const List<CategoryData> categories = [
    CategoryData(
      title: 'Dogs',
      iconPath: 'assets/icons/dog.svg',
    ),
    CategoryData(
      title: 'Cats',
      iconPath: 'assets/icons/cat.svg',
    ),
    CategoryData(
      title: 'Birds',
      iconPath: 'assets/icons/bird.svg',
    ),
    CategoryData(
      title: 'Rabbits',
      iconPath: 'assets/icons/rabbit.svg',
    ),
    CategoryData(
      title: 'Hamsters',
      iconPath: 'assets/icons/hamster.svg',
    ),
  ];
}

class CategoryTile extends StatelessWidget {
  final CategoryData data;
  final bool isSelected;

  const CategoryTile({
    super.key,
    this.isSelected = false,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // icon
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: isSelected ? kLinearGradient : null,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: SvgPicture.asset(
              data.iconPath,
              height: 28,
              width: 28,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : kGreyTextColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),

        // text
        Text(
          data.title,
          style: TextStyle(
            color: isSelected ? kPrimaryColor : kGreyTextColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class PetCategoryTabBar extends StatefulWidget {
  final List<CategoryData> categories;
  final void Function(int index) onTabChanged;

  const PetCategoryTabBar({
    super.key,
    required this.categories,
    required this.onTabChanged,
  });

  @override
  State<PetCategoryTabBar> createState() => _PetCategoryTabBarState();
}

class _PetCategoryTabBarState extends State<PetCategoryTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < widget.categories.length; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = i;
              });
              widget.onTabChanged(i);
            },
            child: CategoryTile(
              data: widget.categories[i],
              isSelected: i == _selectedIndex,
            ),
          ),
      ],
    );
  }
}
