import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'insight_card.dart';

class MyInsightsSection extends StatelessWidget {
  const MyInsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Insights",
            style: GoogleFonts.mulish(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
           SizedBox(height: 16.h),

          Row(
            children: [
              const Expanded(child: CaloriesBox()),
              SizedBox(width: 12.w),
              const Expanded(child: WeightBox()),
            ],
          ),

          SizedBox(height: 16.h),

          const HydrationBox(),
        ],
      ),
    );
  }
}

