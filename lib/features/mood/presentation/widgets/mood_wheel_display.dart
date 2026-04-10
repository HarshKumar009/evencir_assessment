import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/models/mood_model.dart';
import 'mood_center_face_box.dart';
import 'mood_wheel.dart';

class MoodWheelDisplay extends StatelessWidget {
  final MoodModel mood;

  const MoodWheelDisplay({
    super.key,
    required this.mood,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 281.w,
          height: 281.w,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              MoodWheel(
                size: 281,
                pointerAngle: mood.pointerAngle,
              ),
              MoodCenterFaceBox(
                assetPath: mood.assetPath,
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          mood.title,
          style: GoogleFonts.mulish(
            fontSize: 40.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}