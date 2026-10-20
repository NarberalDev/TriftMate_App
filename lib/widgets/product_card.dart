import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 0.95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 9,
              left: 9,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F7F1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  product.condition,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 31,
                height: 31,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 19,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 7),

        Text(
          product.brand.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            letterSpacing: 1,
            color: Color(0xFF60665F),
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 3),

        Row(
          children: [
            Expanded(
              child: Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Text(
              'Rp ${product.price}k',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF29422D),
              ),
            ),
          ],
        ),
      ],
    );
  }
}