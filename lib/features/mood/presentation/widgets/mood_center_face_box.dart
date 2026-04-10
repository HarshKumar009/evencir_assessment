import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodCenterFaceBox extends StatelessWidget {
  final String assetPath;

  const MoodCenterFaceBox({
    super.key,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.r,
      height: 110.r,
      decoration: BoxDecoration(
        color: const Color(0xFFF0CFC4),
        borderRadius: BorderRadius.circular(32.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}