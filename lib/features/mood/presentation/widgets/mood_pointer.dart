import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodPointer extends StatelessWidget {
  const MoodPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 57.5.r,
      height: 57.5.r,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFE2F0EE),
          border: Border.all(
            color: const Color(0xFFFDFDFD),
            width: 3.w,
          ),
        ),
      ),
    );
  }
}