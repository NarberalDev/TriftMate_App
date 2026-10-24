
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const Color backgroundColor = Color(0xFFF7F5EE);
  static const Color profileColor = Color(0xFFDFE7D8);
  static const Color primaryColor = Color(0xFF152719);
  static const Color secondaryColor = Color(0xFF788078);
  static const Color logoutColor = Color(0xFFAD3D18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 16),
                    _buildProfileCard(),
                    const SizedBox(height: 14),

                    _buildSectionTitle('ACCOUNT & PREFERENCES'),
                    const SizedBox(height: 8),
                    _buildMenuGroup([
                      _MenuData(
                        icon: Icons.account_box_outlined,
                        title: 'Account Settings',
                        onTap: () {},
                      ),
                      _MenuData(
                        icon: Icons.notifications_none,
                        title: 'Notifications',
                        trailing: 'On',
                        onTap: () {},
                      ),
                      _MenuData(
                        icon: Icons.lock_outline,
                        title: 'Privacy & Security',
                        onTap: () {},
                      ),
                      _MenuData(
                        icon: Icons.translate,
                        title: 'Language',
                        trailing: 'English',
                        onTap: () {},
                      ),
                    ]),

                    const SizedBox(height: 14),
                    _buildSectionTitle('SHOPPING'),
                    const SizedBox(height: 8),
                    _buildMenuGroup([
                      _MenuData(
                        icon: Icons.credit_card_outlined,
                        title: 'Payment Methods',
                        trailing: '2 saved',
                        onTap: () {},
                      ),
                      _MenuData(
                        icon: Icons.location_on_outlined,
                        title: 'Shipping Addresses',
                        trailing: '1 saved',
                        onTap: () {},
                      ),
                    ]),

                    const SizedBox(height: 14),
                    _buildMenuGroup([
                      _MenuData(
                        icon: Icons.help_outline,
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      _MenuData(
                        icon: Icons.logout,
                        title: 'Log Out',
                        isLogout: true,
                        onTap: () => _showLogoutDialog(context),
                      ),
                    ]),

                    const SizedBox(height: 14),
                    const Center(
                      child: Text(
                        'ThriftMate v1.0.0 • Made for a circular future',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _buildBottomNavigation(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.maybePop(context),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE0E0D9)),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 15,
                color: primaryColor,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 36),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: profileColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 19,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ryan Saysiyo Banjarnahor',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'ryanbanurb19@gmail.com',
                  style: TextStyle(
                    fontSize: 10,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.verified_user_outlined,
            size: 21,
            color: primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: Color(0xFF4F5B50),
      ),
    );
  }

  Widget _buildMenuGroup(List<_MenuData> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          return InkWell(
            onTap: item.onTap,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 52,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      size: 20,
                      color: item.isLogout
                          ? logoutColor
                          : primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: item.isLogout
                              ? logoutColor
                              : Colors.black,
                        ),
                      ),
                    ),
                    if (item.trailing != null) ...[
                      Text(
                        item.trailing!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    const Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: Color(0xFFADB2AB),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    final items = [
      _NavData(Icons.home_outlined, 'Home'),
      _NavData(Icons.search, 'Search'),
      _NavData(Icons.add_circle_outline, 'Sell'),
      _NavData(Icons.shopping_bag_outlined, 'Orders'),
      _NavData(Icons.person_outline, 'Profile'),
    ];

    return Container(
      height: 68,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE0DED5)),
        ),
      ),
      child: Row(
        children: items.map((item) {
          final selected = item.label == 'Profile';

          return Expanded(
            child: InkWell(
              onTap: () {
                // Hubungkan ke halaman Home, Search, Sell,
                // Orders, atau Profile sesuai navigasi proyek.
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    size: 19,
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
        }).toList(),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: const Text('Log Out'),
          content: const Text(
            'Apakah kamu yakin ingin keluar dari akun?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'Batal',
                style: TextStyle(color: secondaryColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                // Tambahkan navigasi ke halaman Login di sini.
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: logoutColor),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MenuData {
  final IconData icon;
  final String title;
  final String? trailing;
  final bool isLogout;
  final VoidCallback onTap;

  const _MenuData({
    required this.icon,
    required this.title,
    this.trailing,
    this.isLogout = false,
    required this.onTap,
  });
}

class _NavData {
  final IconData icon;
  final String label;

  const _NavData(this.icon, this.label);
}
