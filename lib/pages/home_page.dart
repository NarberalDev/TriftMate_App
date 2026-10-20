import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/sdg_banner.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F1),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),

                    const SizedBox(height: 17),

                    const HomeSearchBar(),

                    const SizedBox(height: 14),

                    const SdgBanner(),

                    const SizedBox(height: 15),

                    _buildProductHeader(),

                    const SizedBox(height: 11),

                    _buildProducts(),
                  ],
                ),
              ),
            ),

            BottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning, ${widget.userName}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF6C716C)),
              ),

              const SizedBox(height: 2),

              const Text(
                'Find your next favorite',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172018),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFFE1D3B7),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: Color(0xFF5B4832), size: 23),
        ),
      ],
    );
  }

  Widget _buildProductHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Freshly thrifted',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20251F),
            ),
          ),
        ),

        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'See all',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF29422D),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProducts() {
    if (products.isEmpty) {
      return _buildEmptyProducts();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 22,
        childAspectRatio: 0.69,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }

  Widget _buildEmptyProducts() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE3E1D9)),
      ),
      child: const Column(
        children: [
          Icon(Icons.shopping_bag_outlined, size: 38, color: Color(0xFF8B938B)),

          SizedBox(height: 10),

          Text(
            'No thrifted items yet',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF303830),
            ),
          ),

          SizedBox(height: 5),

          Text(
            'Thrifted items will appear here once products are added.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: Color(0xFF777C77),
            ),
          ),
        ],
      ),
    );
  }
}
