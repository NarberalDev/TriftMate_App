
import 'package:flutter/material.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const Color backgroundColor = Color(0xFFF8F7F1);
  static const Color primaryColor = Color(0xFF244C32);
  static const Color textColor = Color(0xFF202820);
  static const Color secondaryTextColor = Color(0xFF737A71);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Brand Header
              _buildBrandHeader(),

              const SizedBox(height: 30),

              // Hero Banner
              _buildHeroBanner(),

              const SizedBox(height: 30),

              // Headline
              const Text(
                'CIRCULAR FASHION STARTS HERE',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Eco-friendly\nShopping (SDG 12)',
                style: TextStyle(
                  color: textColor,
                  fontSize: 32,
                  height: 1.15,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Discover pre-loved fashion, give clothes '
                'a second life, and make a positive impact '
                'on our planet.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),

              const Spacer(),

              // Get Started Button
              _buildGetStartedButton(context),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Brand Header
  Widget _buildBrandHeader() {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.eco_outlined,
            color: Colors.white,
            size: 25,
          ),
        ),

        const SizedBox(width: 12),

        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ThriftMate',
              style: TextStyle(
                color: textColor,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'FASHION WITH A PURPOSE',
              style: TextStyle(
                color: secondaryTextColor,
                fontSize: 9,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Hero Banner
  Widget _buildHeroBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: AspectRatio(
        aspectRatio: 0.95,
        child: Image.asset(
          'assets/thriftmate_hero.png',
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFFE1E8DA),
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.checkroom_outlined,
                    size: 70,
                    color: primaryColor,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Give fashion a second life',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Get Started Button
  Widget _buildGetStartedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get Started',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, size: 19),
          ],
        ),
      ),
    );
  }
}
