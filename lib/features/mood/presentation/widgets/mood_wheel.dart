import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../painters/mood_wheel_painter.dart';
import 'mood_pointer.dart';

class MoodWheel extends StatelessWidget {
  final double size;
  final double pointerAngle;

  const MoodWheel({
    super.key,
    this.size = 281,
    required this.pointerAngle,
  });

  @override
  Widget build(BuildContext context) {
    final strokeWidth = 32.w;
    final pointerSize = 57.5.r;
    final responsiveSize = size.w;

    final center = responsiveSize / 2;
    final ringRadius = (responsiveSize / 2) - (strokeWidth / 2);

    final pointerCenter = Offset(
      center + ringRadius * math.cos(pointerAngle),
      center + ringRadius * math.sin(pointerAngle),
    );

    return SizedBox(
      width: responsiveSize,
      height: responsiveSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size.square(responsiveSize),
            painter: MoodWheelPainter(
              strokeWidth: strokeWidth,
            ),
          ),
          Positioned(
            left: pointerCenter.dx - (pointerSize / 2),
            top: pointerCenter.dy - (pointerSize / 2),
            child: const MoodPointer(),
          ),
        ],
      ),
    );
  }
}