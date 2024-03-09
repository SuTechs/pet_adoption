import 'package:flutter/material.dart';

import '../constants.dart';

class OwnerInfoCard extends StatelessWidget {
  const OwnerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Row(
        children: [
          /// owner photo
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: kPrimaryColor, width: 2),
              image: const DecorationImage(
                image: NetworkImage(kDummyProfilePicUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),

          /// owner name
          RichText(
            text: const TextSpan(
              text: 'OWNED BY\n',
              style: TextStyle(
                color: kGreyTextColor,
                fontSize: 12,
              ),
              children: [
                TextSpan(
                  text: 'Rohan Patil',
                  style: TextStyle(
                    color: kBrownColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          /// contact button

          const Spacer(),

          /// message button
          const ContactActionButton(icon: Icons.message),
          const SizedBox(width: 16),

          /// call button
          const ContactActionButton(icon: Icons.call),
        ],
      ),
    );
  }
}

class ContactActionButton extends StatelessWidget {
  final IconData icon;

  const ContactActionButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        icon,
        color: kPrimaryColor,
      ),
    );
  }
}
