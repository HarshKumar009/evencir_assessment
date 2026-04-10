import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/date_formatter.dart';
import '../providers/home_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calendar_bottom_sheet.dart';

class CustomTopBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomTopBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);

    int currentWeek = DateUtilsHelper.getWeekOfMonth(selectedDate);
    int totalWeeks = DateUtilsHelper.getTotalWeeksInMonth(selectedDate);

    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: 60.h,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: UnconstrainedBox(
          child: Image.asset(
            'assets/icons/alert.png',
            height: 24.h,
            width: 24.w,
          ),
        ),
      ),
      title: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) => const CalendarBottomSheet(),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/weeks.png',
              height: 20.h,
              width: 20.w,
            ),
            SizedBox(width: 8.w),
            Text(
              "Week $currentWeek/$totalWeeks",
              style: GoogleFonts.mulish(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                height: 16.8 / 14,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.white, size: 20.sp,),
          ],
        ),
      ),
      actions:  [
        SizedBox(width: 56.w),
      ],
    );
  }
}