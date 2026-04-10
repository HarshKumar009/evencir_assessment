import 'dart:math' as math;
import 'package:flutter/material.dart';

class MoodWheelPainter extends CustomPainter {
  final double strokeWidth;

  const MoodWheelPainter({
    this.strokeWidth = 32.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (strokeWidth / 2);
    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true
      ..shader = SweepGradient(
        transform: const GradientRotation(-math.pi / 2),
        colors: const [
          Color(0xFF6EB9AD),
          Color(0xFF6EB9AD),
          Color(0xFFC9BBEF),
          Color(0xFFC9BBEF),
          Color(0xFFF28DB3),
          Color(0xFFF28DB3),
          Color(0xFFF99955),
          Color(0xFFF99955),
          Color(0xFF6EB9AD),
        ],
        stops: const [
          0.00,
          0.23,
          0.27,
          0.48,
          0.52,
          0.73,
          0.77,
          0.98,
          1.00,
        ],
      ).createShader(rect);

    canvas.drawCircle(center, radius, paint);

    final dividerPaint = Paint()
      ..color = Colors.white.withOpacity(0.18)
      ..strokeWidth = strokeWidth * 0.0625 // 32 ka 2 tha, same ratio
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    const totalDividers = 12;

    for (int i = 0; i < totalDividers; i++) {
      final angle = (-math.pi / 2) + (2 * math.pi * i / totalDividers);

      final innerPoint = Offset(
        center.dx + (radius - strokeWidth / 2) * math.cos(angle),
        center.dy + (radius - strokeWidth / 2) * math.sin(angle),
      );

      final outerPoint = Offset(
        center.dx + (radius + strokeWidth / 2) * math.cos(angle),
        center.dy + (radius + strokeWidth / 2) * math.sin(angle),
      );

      canvas.drawLine(innerPoint, outerPoint, dividerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant MoodWheelPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth;
  }
}