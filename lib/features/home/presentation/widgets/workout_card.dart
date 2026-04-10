import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double upperBodyLetterSpacing = -0.48.w;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
          decoration:  BoxDecoration(
            color: Color(0xFF18181C),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            border: Border(
              left: BorderSide(
                color: Color(0xFF32AAB7),
                width: 7.w,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "December 22 - 25m - 30m",
                      style: GoogleFonts.mulish(
                        color: const Color(0xFFEBEBEB),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Upper Body",
                      style: GoogleFonts.mulish(
                        color: const Color(0xFFEBEBEB),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        letterSpacing: upperBodyLetterSpacing,
                      ),
                    ),
                  ],
                ),
              ),
               Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}