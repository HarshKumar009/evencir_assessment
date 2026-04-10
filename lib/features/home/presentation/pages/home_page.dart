import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/horizontal_calendar.dart';
import '../../../plan/presentation/widgets/workout_header.dart';
import '../widgets/my_insights_section.dart';
import '../widgets/workout_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomTopBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalCalendar(),
            WorkoutHeader(),
            WorkoutCard(),
            MyInsightsSection(),
            SizedBox(height: 20.h),
          ],
        ),
      ),


    );
  }
}