
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/bottom_nav_provider.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, "Nutrition", 'assets/icons/nutrition.png', currentIndex, ref),
              _buildNavItem(1, "Plan", 'assets/icons/plan.png', currentIndex, ref),
              _buildNavItem(2, "Mood", 'assets/icons/mood.png', currentIndex, ref),
              _buildNavItem(3, "Profile", 'assets/icons/profile.png', currentIndex, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath, int currentIndex, WidgetRef ref) {
    final isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () => ref.read(bottomNavIndexProvider.notifier).state = index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath,   width: 24.w, height: 24.h, color: isSelected ? Colors.white : const Color(0xFF8E8E93)),
          SizedBox(height: 6.h),
          Text(label, style: GoogleFonts.mulish(fontSize: 12.sp, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500, color: isSelected ? Colors.white : const Color(0xFF8E8E93))),
        ],
      ),
    );
  }
}