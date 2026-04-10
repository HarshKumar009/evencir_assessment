import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/date_formatter.dart';
import '../providers/home_provider.dart';

class HorizontalCalendar extends ConsumerWidget {
  const HorizontalCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final weekDates = DateUtilsHelper.getWeekDays(selectedDate);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 24.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              DateUtilsHelper.formatDateForHeader(selectedDate),
              style: GoogleFonts.mulish(
                color: const Color(0xFFEBEBEB),
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 85.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekDates.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemBuilder: (context, index) {
                final date = weekDates[index];
                final isSelected = date.day == selectedDate.day;

                return _DateItem(
                  date: date,
                  isSelected: isSelected,
                  onTap: () {
                    ref.read(selectedDateProvider.notifier).state = date;
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class _DateItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateItem({
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45.w,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateUtilsHelper.getShortWeekday(date),
              style: GoogleFonts.mulish(
                color: const Color(0xFF8E8E93),
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 36.h,
              width: 36.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFF20B76F).withOpacity(0.19)
                    : const Color(0xFF18181C),
                border: isSelected
                    ? Border.all(color: const Color(0xFF20B76F),  width: 2.w,)
                    : null,
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: GoogleFonts.mulish(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 5.h,
              width: 5.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF20B76F) : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}