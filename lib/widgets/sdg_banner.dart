import 'package:flutter/material.dart';

class SdgBanner extends StatelessWidget {
  const SdgBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xDDE3DBD2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SDG 12 • RESPONSIBLE CONSUMPTION',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: Color(0xFF28532D),
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Reduce Waste, Shop Thrift',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1D3521),
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  'One pre-loved piece = one smarter choice.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF5C625C),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF304A32),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.recycling,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}