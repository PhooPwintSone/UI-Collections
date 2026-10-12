import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:ui_collections/wallet_login_signup/theme/wallet_theme_color.dart';
import 'package:ui_collections/wallet_login_signup/widgets/social_button.dart';
import 'package:ui_collections/wallet_login_signup/widgets/tap_shape_painter.dart';
import 'package:ui_collections/wallet_login_signup/widgets/wallet_ui_textfield.dart';

class WalletLoginScreen extends StatefulWidget {
  const WalletLoginScreen({super.key});

  @override
  State<WalletLoginScreen> createState() => _WalletLoginScreenState();
}

class _WalletLoginScreenState extends State<WalletLoginScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletThemeColor.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: WalletThemeColor.cardColor,
                    radius: 20,
                    child: const Icon(
                      Icons.headset_mic_outlined,
                      color: WalletThemeColor.accentPrimary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Welcome Text
              Text(
                isLogin ? 'Welcome Back' : 'Create Account',
                style: const TextStyle(
                  color: WalletThemeColor.accentPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isLogin
                    ? 'Log in to manage your crypto wallet'
                    : 'Sign up to start trading crypto',
                style: const TextStyle(
                  color: WalletThemeColor.textFaded,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialButton(icon: Icons.g_mobiledata),
                  SocialButton(icon: Icons.apple),
                  SocialButton(icon: Icons.facebook),
                  SocialButton(icon: Icons.close),
                ],
              ),
              const SizedBox(height: 40),

              // ==========================================
              // --- CUSTOM PAINTED FOLDER UI ---
              // ==========================================
              Stack(
                children: [
                  // 1. The Custom Painted Background Shape
                  Positioned.fill(
                    child: CustomPaint(
                      painter: TabShapePainter(
                        isLogin: isLogin,
                        color: WalletThemeColor.cardColor,
                      ),
                    ),
                  ),

                  // 2. The Content Layer (Tabs + Form)
                  Column(
                    children: [
                      // Transparent Tap Areas for Tabs
                      SizedBox(
                        height: 56,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isLogin = true),
                                behavior: HitTestBehavior.opaque,
                                child: Center(
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: isLogin
                                          ? Colors.white
                                          : WalletThemeColor.textFaded,
                                      fontWeight: isLogin
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isLogin = false),
                                behavior: HitTestBehavior.opaque,
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: !isLogin
                                          ? Colors.white
                                          : WalletThemeColor.textFaded,
                                      fontWeight: !isLogin
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Form Fields
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            AnimatedSize(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                              child: Column(
                                children: [
                                  if (!isLogin) ...[
                                    const WalletUiTextfield(
                                      label: 'Username',
                                      hintText: 'john_doe',
                                      icon: Icons.person_outline,
                                    ),
                                    const SizedBox(height: 24),
                                  ],
                                  const WalletUiTextfield(
                                    label: 'Email Address',
                                    hintText: 'user@example.com',
                                    icon: Icons.alternate_email,
                                  ),
                                  const SizedBox(height: 24),
                                  const WalletUiTextfield(
                                    label: 'Password',
                                    hintText: '•••••••',
                                    icon: Icons.lock_outline,
                                    isPassword: true,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                            AnimatedOpacity(
                              opacity: isLogin ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: isLogin
                                  ? Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color:
                                                WalletThemeColor.accentPrimary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(height: 36),
                            ),
                            const SizedBox(height: 8),

                            SlideAction(
                              outerColor: WalletThemeColor.accentSecondary,
                              innerColor: Colors.white,
                              sliderButtonIcon: const Icon(
                                Icons.arrow_forward_ios,
                                color: WalletThemeColor.accentSecondary,
                                size: 20,
                              ),
                              text: isLogin
                                  ? 'Swipe to Log In'
                                  : 'Swipe to Sign Up',
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              onSubmit: () async {
                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // ==========================================
            ],
          ),
        ),
      ),
    );
  }
}
