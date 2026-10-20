import 'package:flutter/material.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: Color(0xFF304A32),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.eco_outlined,
            color: Colors.white,
            size: 21,
          ),
        ),

        const SizedBox(width: 12),

        const Text(
          'ThriftMate',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF29422D),
          ),
        ),
      ],
    );
  }
}