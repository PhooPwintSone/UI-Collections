import 'package:flutter/cupertino.dart';

class TabShapePainter extends CustomPainter {
  final bool isLogin;
  final Color color;

  TabShapePainter({required this.isLogin, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path();

    final double tabHeight = 56.0;
    final double radius = 24.0;
    final double curveWidth = 30.0; // Width of the smooth S-curve
    final double halfWidth = size.width / 2;

    if (isLogin) {
      // Draw path for when 'Log In' (Left) is active
      path.moveTo(0, radius);
      path.quadraticBezierTo(0, 0, radius, 0); // Top left
      path.lineTo(halfWidth - curveWidth, 0);

      // Smooth S-Curve sloping down to the right
      path.cubicTo(
        halfWidth,
        0,
        halfWidth,
        tabHeight,
        halfWidth + curveWidth,
        tabHeight,
      );

      path.lineTo(size.width - radius, tabHeight);
      path.quadraticBezierTo(
        size.width,
        tabHeight,
        size.width,
        tabHeight + radius,
      ); // Top right (lower)

      path.lineTo(size.width, size.height - radius);
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width - radius,
        size.height,
      ); // Bottom right

      path.lineTo(radius, size.height);
      path.quadraticBezierTo(
        0,
        size.height,
        0,
        size.height - radius,
      ); // Bottom left
      path.close();
    } else {
      // Draw path for when 'Sign Up' (Right) is active
      path.moveTo(0, tabHeight + radius);
      path.quadraticBezierTo(
        0,
        tabHeight,
        radius,
        tabHeight,
      ); // Top left (lower)
      path.lineTo(halfWidth - curveWidth, tabHeight);

      // Smooth S-Curve sloping up to the right
      path.cubicTo(
        halfWidth,
        tabHeight,
        halfWidth,
        0,
        halfWidth + curveWidth,
        0,
      );

      path.lineTo(size.width - radius, 0);
      path.quadraticBezierTo(size.width, 0, size.width, radius); // Top right

      path.lineTo(size.width, size.height - radius);
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width - radius,
        size.height,
      ); // Bottom right

      path.lineTo(radius, size.height);
      path.quadraticBezierTo(
        0,
        size.height,
        0,
        size.height - radius,
      ); // Bottom left
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TabShapePainter oldDelegate) {
    return oldDelegate.isLogin != isLogin || oldDelegate.color != color;
  }
}
