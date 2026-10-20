import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 49,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFD8D8D2),
              ),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search brands, styles, pieces...',
                hintStyle: TextStyle(
                  color: Color(0xFFA5A8A3),
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF4E5750),
                  size: 22,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            color: const Color(0xFF304A32),
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Icon(
            Icons.tune,
            color: Colors.white,
            size: 21,
          ),
        ),
      ],
    );
  }
}