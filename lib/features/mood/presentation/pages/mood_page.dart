import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/mood_controller.dart';
import '../widgets/mood_wheel_display.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  final MoodController controller = MoodController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = 1.sw;
    final glowSize = screenWidth * 1.45;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final currentMood = controller.currentMood;

        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),


              Positioned(
                top: -(glowSize * 0.55),
                left: -(glowSize - screenWidth) / 2,
                child: IgnorePointer(
                  child: Container(
                    width: glowSize,
                    height: glowSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 0.72,
                        colors: [
                          const Color(0xFF8FA2E0).withOpacity(0.55),
                          const Color(0xFF4D68A5).withOpacity(0.22),
                          const Color(0xFF122038).withOpacity(0.08),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.38, 0.68, 1.0],
                      ),
                    ),
                  ),
                ),
              ),


              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "Mood",
                        style: GoogleFonts.mulish(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "Start your day",
                        style: GoogleFonts.mulish(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF66667E),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "How are you feeling at the\nMoment?",
                        style: GoogleFonts.mulish(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: MoodWheelDisplay(mood: currentMood),
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.nextMood,
                        child: Container(
                          width: double.infinity,
                          height: 56.h,
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Continue",
                              style: GoogleFonts.mulish(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

