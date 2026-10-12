import 'package:flutter/material.dart';
import 'package:ui_collections/wallet_login_signup/theme/wallet_theme_color.dart';

class WalletUiTextfield extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final VoidCallback? onIconTap;

  const WalletUiTextfield({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.onIconTap,
  });

  @override
  State<WalletUiTextfield> createState() => _WalletUiTextfieldState();
}

class _WalletUiTextfieldState extends State<WalletUiTextfield> {
  // Local state to track password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Determine the icon dynamically if it's a password field
    IconData displayIcon = widget.isPassword
        ? (_isPasswordVisible ? Icons.visibility : Icons.visibility_off)
        : widget.icon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align label to the left
      children: [
        Text(
          widget.label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 8),
        TextField(
          // Toggle obscureText based on local state
          obscureText: widget.isPassword && !_isPasswordVisible,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
            filled: true,
            fillColor: WalletThemeColor.bgColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                // If it's a password field, toggle visibility internally
                if (widget.isPassword) {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                }
                // Otherwise, trigger the external callback if provided
                else if (widget.onIconTap != null) {
                  widget.onIconTap!();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CircleAvatar(
                  backgroundColor: WalletThemeColor.cardColor,
                  radius: 16,
                  child: Icon(
                    displayIcon,
                    color: WalletThemeColor.accentSecondary,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
