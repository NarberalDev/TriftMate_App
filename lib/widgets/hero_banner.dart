import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(27),
      child: AspectRatio(
        aspectRatio: 365 / 437,
        child: Image.asset(
          'assets/thriftmate_hero.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}