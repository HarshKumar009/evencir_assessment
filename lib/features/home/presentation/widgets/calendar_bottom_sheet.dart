import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/date_formatter.dart';
import '../providers/home_provider.dart';

class CalendarBottomSheet extends ConsumerStatefulWidget {
  const CalendarBottomSheet({super.key});

  @override
  ConsumerState<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends ConsumerState<CalendarBottomSheet> {
  late DateTime focusedMonth;

  @override
  void initState() {
    super.initState();
    focusedMonth = ref.read(selectedDateProvider);
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);

    final firstDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final lastDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final leadingEmptyDays = firstDayOfMonth.weekday - 1;

    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 24.w,
        right: 24.w,
        bottom: 16.h,
      ),
      decoration:  BoxDecoration(
        color: Color(0xFF18181C),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: const Color(0xFF444446),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(height: 24.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.white, size: 24.sp),
                onPressed: () => setState(() => focusedMonth = DateTime(focusedMonth.year, focusedMonth.month - 1)),
              ),
              Text(
                DateUtilsHelper.formatMonthYear(focusedMonth),
                style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white, size: 24.sp),
                onPressed: () => setState(() => focusedMonth = DateTime(focusedMonth.year, focusedMonth.month + 1)),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: DateUtilsHelper.weekDays.map((day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: GoogleFonts.mulish(
                    color: const Color(0xFF8E8E93),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )).toList(),
          ),
          SizedBox(height: 16.h),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 1,
            ),
            itemCount: daysInMonth + leadingEmptyDays,
            itemBuilder: (context, index) {
              if (index < leadingEmptyDays) return const SizedBox.shrink();

              final day = index - leadingEmptyDays + 1;
              final date = DateTime(focusedMonth.year, focusedMonth.month, day);
              final isSelected = date.year == selectedDate.year &&
                  date.month == selectedDate.month &&
                  date.day == selectedDate.day;

              return GestureDetector(
                onTap: () {
                  ref.read(selectedDateProvider.notifier).state = date;
                  Navigator.pop(context);
                },
                child: Center(
                  child: Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? const Color(0xFF20B76F).withOpacity(0.19)
                          : Colors.transparent,
                      border: isSelected
                          ? Border.all(color: const Color(0xFF20B76F), width: 2.w)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        "$day",
                        style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}