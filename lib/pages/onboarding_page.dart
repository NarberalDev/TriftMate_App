import 'package:flutter/material.dart';
import '../widgets/brand_header.dart';
import '../widgets/hero_banner.dart';
import '../widgets/get_started_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 42),

              const BrandHeader(),

              const SizedBox(height: 40),

              const HeroBanner(),

              const SizedBox(height: 38),

              const Text(
                'CIRCULAR FASHION STARTS HERE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: Color(0xFFD85B2B),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Eco-friendly\nShopping (SDG 12)',
                style: TextStyle(
                  fontSize: 36,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172018),
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'Find pre-loved pieces with plenty of life left—and '
                'help keep great style out of landfill.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.45,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF60665F),
                ),
              ),

              const Spacer(),

              const GetStartedButton(),

              const SizedBox(height: 27),
            ],
          ),
        ),
      ),
    );
  }
}