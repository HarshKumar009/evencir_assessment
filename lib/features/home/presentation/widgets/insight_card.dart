import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CaloriesBox extends StatelessWidget {
  const CaloriesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151.56.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFF18181C),
        borderRadius: BorderRadius.circular(6.89.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "550",
                    style: GoogleFonts.mulish(fontSize: 40.sp, fontWeight: FontWeight.w600, color: Colors.white, height: 1.0),
                  ),
                ),
              ),
               SizedBox(width: 2.w),
              Flexible(
                child: Text(
                  "Calories",
                  style: GoogleFonts.mulish(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white, height: 1),
                ),
              ),
              SizedBox(width: 12.w),
            ],
          ),

          Text("1950 Remaining", style: GoogleFonts.mulish(fontSize: 14.sp, color: const Color(0xFFA4A4A4))),
          const Spacer(),
          Container(
            height: 6.h,
            decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(6.r)),
            child: FractionallySizedBox(
              widthFactor: 0.22,
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), gradient: const LinearGradient(colors: [Color(0xFF7BBDE2), Color(0xFF69C0B1), Color(0xFF60C198)]))),
            ),
          ),
          SizedBox(height: 4.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("0", style: TextStyle(fontSize: 12.sp, color: Color(0xFF7E7E7E))),
            Text("2500", style: TextStyle(fontSize: 12.sp, color: Color(0xFF7E7E7E))),
          ])
        ],
      ),
    );
  }
}

class WeightBox extends StatelessWidget {
  const WeightBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151.56.h,
      padding:  EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF18181C),
        borderRadius: BorderRadius.circular(6.89.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text("75", style: GoogleFonts.mulish(fontSize: 40.sp, fontWeight: FontWeight.w700, color: Colors.white, height: 1.0)),
               SizedBox(width: 4.w),
              Text("kg", style: GoogleFonts.mulish(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white, height: 1.2)),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Container(
                width: 15.w,
                height: 15.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF154124),
                  shape: BoxShape.circle,
                ),
                child:  Center(
                  child: Icon(
                    Icons.arrow_outward,
                    color: Color(0xFF01A53C),
                    size: 10.sp,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "+1.6kg",
                style: GoogleFonts.mulish(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFA4A4A4),
                  height: 1.0,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text("Weight", style: GoogleFonts.mulish(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white, height: 1.2)),
        ],
      ),
    );
  }
}

class HydrationBox extends StatelessWidget {
  const HydrationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF18181C),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 124.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("0%", style: GoogleFonts.mulish(fontSize: 40.sp, fontWeight: FontWeight.w600, color: const Color(0xFF48A4E5), height: 1.0)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hydration", style: GoogleFonts.mulish(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white)),
                            Text("Log Now", style: GoogleFonts.mulish(fontSize: 14.sp, color: const Color(0xFFA4A4A4))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const Expanded(
                  flex: 2,
                  child: _HydrationScale(),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration:  BoxDecoration(
              color: Color(0xFF1B3D45),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
            ),
            child: Center(
              child: Text("500 ml added to water log", style: GoogleFonts.mulish(fontSize: 14.sp, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class _HydrationScale extends StatelessWidget {
  const _HydrationScale();

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 12.h;

    return SizedBox(
      height: 124.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            width: 25.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: itemHeight,
                  alignment: Alignment.centerRight,
                  child: Text("2 L", style: GoogleFonts.mulish(fontSize: 10.sp, fontWeight: FontWeight.w600, color: const Color(0xFFFBFBFB), height: 1.2)),
                ),
                Container(
                  height: itemHeight,
                  alignment: Alignment.centerRight,
                  child: Text("0 L", style: GoogleFonts.mulish(fontSize: 10.sp, fontWeight: FontWeight.w600, color: const Color(0xFFFBFBFB), height: 1.2)),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(11, (index) {
              bool isMajor = index == 0 || index == 5 || index == 10;

              Widget tick = Container(
                width: isMajor ? 12.w : 6.w,
                height: isMajor ? 4.h : 2.h,
                decoration: BoxDecoration(
                  color: isMajor ? const Color(0xFF48A4E5) : const Color(0xFF2A3642),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              );

              if (isMajor) {
                return Container(
                  height: itemHeight,
                  alignment: Alignment.centerLeft,
                  child: tick,
                );
              }

              return tick;
            }),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.h,
                        color: const Color(0xFF3B3B3B),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "0ml",
                      style: GoogleFonts.mulish(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white, height: 1.0),
                    ),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}