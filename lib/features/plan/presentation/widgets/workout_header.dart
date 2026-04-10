import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../home/presentation/providers/weather_provider.dart';

class WorkoutHeader extends ConsumerWidget {
  const WorkoutHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentHour = DateTime.now().hour;
    final bool isDayTime = currentHour > 6 && currentHour < 18;

    final IconData weatherIcon = isDayTime
        ? Icons.wb_sunny_rounded
        : Icons.nights_stay_rounded;

    final tempAsyncValue = ref.watch(temperatureProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Workouts",
            style: GoogleFonts.mulish(
              color: const Color(0xFFEBEBEB),
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),

          Row(
            children: [
              Icon(
                weatherIcon,
                color: Colors.white,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),

              tempAsyncValue.when(
                data: (temperature) => Text(
                  "${temperature.round()}°",
                  style: GoogleFonts.mulish(
                    color: const Color(0xFFEBEBEB),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                loading: () =>  SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                ),
                error: (err, stack) => Icon(Icons.error, color: Colors.red, size: 24.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}