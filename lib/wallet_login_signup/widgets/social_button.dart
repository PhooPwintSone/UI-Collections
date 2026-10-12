import 'package:flutter/material.dart';
import 'package:ui_collections/wallet_login_signup/theme/wallet_theme_color.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  const SocialButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: WalletThemeColor.accentPrimary,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: WalletThemeColor.bgColor, size: 35),
    );
  }
}
