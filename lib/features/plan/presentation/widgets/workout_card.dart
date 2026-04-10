import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/models/workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      decoration: BoxDecoration(
        color: const Color(0xFF18181C),
        borderRadius: BorderRadius.circular(8.r),
        border: Border(left: BorderSide(color: workout.color, width: 6.w)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          Icon(Icons.drag_indicator, color: Color(0xFF7A7C90), size: 20.sp),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(color: workout.color.withOpacity(0.15), borderRadius: BorderRadius.circular(4.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.directions_run, color: workout.color, size: 10.sp),
                      SizedBox(width: 4.w),
                      Text(workout.type, style: GoogleFonts.mulish(fontSize: 10.sp, color: workout.color, fontWeight: FontWeight.w600,decoration: TextDecoration.none,)),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(workout.title, style: GoogleFonts.mulish(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600,decoration: TextDecoration.none,)),
              ],
            ),
          ),
          Text(workout.time, style: GoogleFonts.mulish(fontSize: 12.sp, color: const Color(0xFFEBEBEB),decoration: TextDecoration.none,)),
        ],
      ),
    );
  }
}