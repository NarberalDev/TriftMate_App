
import 'package:flutter/material.dart';
import '../models/product.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({
    super.key,
    required this.userName,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color backgroundColor = Color(0xFFF8F7F1);
  static const Color primaryColor = Color(0xFF244C32);
  static const Color textColor = Color(0xFF202820);
  static const Color secondaryColor = Color(0xFF737A71);
  static const Color bannerColor = Color(0xFFE1E8DA);

  int _currentIndex = 0;

  // Tetap menggunakan model Product yang sudah ada.
  final List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),

                    const SizedBox(height: 24),

                    _buildSearchBar(),

                    const SizedBox(height: 22),

                    _buildSdgBanner(),

                    const SizedBox(height: 28),

                    _buildSectionHeader(),

                    const SizedBox(height: 16),

                    _buildProductContent(),
                  ],
                ),
              ),
            ),

            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader() {
    final name = widget.userName.trim().isEmpty
        ? 'there'
        : widget.userName.trim();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good morning,',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Find your next favorite',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xFFE9E4D8),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person_outline,
            color: primaryColor,
            size: 25,
          ),
        ),
      ],
    );
  }

  // Search Bar
  Widget _buildSearchBar() {
    return TextField(
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Pencarian: ${value.trim()}'),
            ),
          );
        }
      },
      decoration: InputDecoration(
        hintText: 'Search pre-loved fashion...',
        hintStyle: const TextStyle(
          color: Color(0xFF999E96),
          fontSize: 12,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: secondaryColor,
          size: 21,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFFE9E8E1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.3,
          ),
        ),
      ),
    );
  }

  // SDG 12 Banner
  Widget _buildSdgBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bannerColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'SDG 12',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Wear more.\nWaste less.',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    height: 1.25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Give fashion a second life '
                  'with responsible shopping.',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 11,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.eco_outlined,
            color: primaryColor,
            size: 64,
          ),
        ],
      ),
    );
  }

  // Section Header
  Widget _buildSectionHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Freshly thrifted',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _currentIndex = 1;
            });
            _showNavigationMessage('Search');
          },
          child: const Text(
            'See all',
            style: TextStyle(
              color: primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // Product Content / Empty State
  Widget _buildProductContent() {
    if (products.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFE9E8E1),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 66,
              height: 66,
              decoration: const BoxDecoration(
                color: Color(0xFFE9EDE5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.checkroom_outlined,
                color: primaryColor,
                size: 34,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Nothing here just yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'New pre-loved treasures will appear here. '
              'Stay tuned!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
                _showNavigationMessage('Sell');
              },
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Sell an item'),
              style: OutlinedButton.styleFrom(
                foregroundColor: primaryColor,
                side: const BorderSide(color: primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Data produk dapat ditampilkan di bagian ini
    // setelah model Product dan fitur katalog diintegrasikan.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'Produk tersedia untuk ditampilkan.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: secondaryColor,
          fontSize: 12,
        ),
      ),
    );
  }

  // Bottom Navigation
  Widget _buildBottomNavigation() {
    final items = [
      _NavItem(Icons.home_outlined, 'Home'),
      _NavItem(Icons.search, 'Search'),
      _NavItem(Icons.add_circle_outline, 'Sell'),
      _NavItem(Icons.shopping_bag_outlined, 'Orders'),
      _NavItem(Icons.person_outline, 'Profile'),
    ];

    return Container(
      height: 68,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE1E0D8),
          ),
        ),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final selected = _currentIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });

                if (index != 0) {
                  _showNavigationMessage(item.label);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    size: 20,
                    color: selected
                        ? primaryColor
                        : const Color(0xFFADB2AB),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: selected
                          ? primaryColor
                          : const Color(0xFFADB2AB),
                    ),
                  ),
                  if (selected) ...[
                    const SizedBox(height: 3),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showNavigationMessage(String destination) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Halaman $destination belum dihubungkan.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem(this.icon, this.label);
}
