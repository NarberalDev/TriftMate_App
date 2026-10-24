import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;

  static const Color backgroundColor = Color(0xFFF8F7F1);
  static const Color primaryColor = Color(0xFF244C32);
  static const Color textColor = Color(0xFF202820);
  static const Color secondaryColor = Color(0xFF737A71);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),

                const SizedBox(height: 30),

                const Text(
                  'Welcome to ThriftMate!',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Join the circular fashion movement. '
                  'Sign in or create your account to get started.',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.6,
                    color: secondaryColor,
                  ),
                ),

                const SizedBox(height: 28),

                _buildInputField(
                  label: 'Name',
                  hint: 'Enter your full name',
                  controller: nameController,
                  icon: Icons.person_outline,
                  keyboardType: TextInputType.name,
                ),

                const SizedBox(height: 16),

                _buildInputField(
                  label: 'Email',
                  hint: 'Enter your email address',
                  controller: emailController,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                _buildInputField(
                  label: 'Phone Number',
                  hint: 'Enter your phone number',
                  controller: phoneController,
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 16),

                _buildInputField(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: passwordController,
                  icon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: secondaryColor,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Fitur Forgot Password belum tersedia.',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                _buildPrimaryButton(),

                const SizedBox(height: 22),

                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFDADDD4))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFDADDD4))),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    Expanded(
                      child: _buildSocialButton(
                        label: 'Google',
                        icon: Icons.g_mobiledata,
                        onPressed: () => _showUnavailableFeature('Google'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSocialButton(
                        label: 'Apple',
                        icon: Icons.apple,
                        onPressed: () => _showUnavailableFeature('Apple'),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                const Center(
                  child: Text(
                    'Fashion with a purpose.',
                    style: TextStyle(fontSize: 11, color: secondaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.eco_outlined, color: Colors.white, size: 25),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ThriftMate',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'FASHION WITH A PURPOSE',
              style: TextStyle(
                fontSize: 9,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Input Field
  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF9A9F97)),
            prefixIcon: Icon(icon, size: 20, color: secondaryColor),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Color(0xFFE1E3DC)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: Color(0xFFE1E3DC)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: primaryColor, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  // Login / Register Button
  Widget _buildPrimaryButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Login / Register',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void _handleLogin() {
    final List<String> emptyFields = [];

    if (nameController.text.trim().isEmpty) {
      emptyFields.add('Nama');
    }

    if (emailController.text.trim().isEmpty) {
      emptyFields.add('Email');
    }

    if (phoneController.text.trim().isEmpty) {
      emptyFields.add('Nomor telepon');
    }

    if (passwordController.text.trim().isEmpty) {
      emptyFields.add('Password');
    }

    // Jika masih ada field kosong, tampilkan peringatan
    // dan hentikan proses sebelum navigasi ke Home.
    if (emptyFields.isNotEmpty) {
      final String message = emptyFields.length == 1
          ? '${emptyFields.first} belum diisi!'
          : '${emptyFields.join(', ')} belum diisi!';

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red.shade700,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );

      return;
    }

    // Navigasi hanya dilakukan jika semua field terisi.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(userName: nameController.text.trim()),
      ),
    );
  }

  // Google / Apple Buttons
  Widget _buildSocialButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 22),
      label: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: Colors.white,
        minimumSize: const Size(0, 48),
        side: const BorderSide(color: Color(0xFFE1E3DC)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      ),
    );
  }

  void _showUnavailableFeature(String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login dengan $provider belum terintegrasi.')),
    );
  }
}
