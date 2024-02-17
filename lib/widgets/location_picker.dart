import 'package:flutter/material.dart';

import '../constants.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.location_on_outlined, color: kGreyTextColor),
      title: Text(
        'Benagluru, India',
        style: TextStyle(color: kGreyTextColor),
      ),
    );
  }
}
