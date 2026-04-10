import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../plan/domain/models/workout_model.dart';
import '../../data/repositories/workout_repository.dart';
import '../widgets/workout_card.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {

  int? expandedIndex = 0;
  bool isSaving = false;
  Map<int, Workout> workouts = {
    8: Workout(type: "Arms Workout", title: "Arm Blaster", time: "25m - 30m", colorValue: 0xFF18AA99),
    11: Workout(type: "Leg Workout", title: "Leg Day Blitz", time: "25m - 30m", colorValue: 0xFF4855DF),
  };

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _saveWorkouts() async {
    setState(() => isSaving = true);
    await Future.delayed(const Duration(milliseconds: 500));
    await WorkoutRepository.saveWorkouts(workouts);
    setState(() => isSaving = false);
    if(mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Plan Saved Successfully!"), backgroundColor: Color(0xFF20B76F))
      );
    }
  }


  void _load() async {
    try {
      final data = await WorkoutRepository.loadWorkouts();
      if (data.isNotEmpty) {
        setState(() => workouts = data);
      }
    } catch (e) {
      debugPrint("Load error: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime startOfCurrentWeek = now.subtract(Duration(days: now.weekday - 1));
    final List<DateTime> weeksStartDates = List.generate(5, (index) => startOfCurrentWeek.add(Duration(days: index * 7)));

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaderSection(),
            Expanded(
              child: ListView.builder(
                itemCount: weeksStartDates.length,
                itemBuilder: (context, index) {
                  final weekStart = weeksStartDates[index];
                  final weekDates = List.generate(7, (d) => weekStart.add(Duration(days: d)));
                  bool isExpanded = expandedIndex == index;

                  return _buildWeekContainer(index, isExpanded, weekDates, index + 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekContainer(int index, bool isExpanded, List<DateTime> weekDates, int weekNumber) {
    final dateRange = "${DateFormat('MMM d').format(weekDates.first)}-${DateFormat('d').format(weekDates.last)}";

    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => expandedIndex = isExpanded ? null : index),
          child: Container(
            padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 12.h),
            decoration: const BoxDecoration(
              color: Color(0xFF121212),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Week $weekNumber", style: GoogleFonts.mulish(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Color(0xFFEBEBEB))),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dateRange, style:  TextStyle(color: Color(0xFF7A7C90),fontSize: 16.sp,fontWeight: FontWeight.w400)),
                     Text("Total: 60min", style: TextStyle(color: Color(0xFF7A7C90),fontSize: 16.sp,fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
        ),

        if (isExpanded)
          Container(
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF18AA99), width: 2.h)),
            ),
            child: Column(
              children: weekDates.map((date) => _buildDayRow(date)).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildDayRow(DateTime date) {
    final bool hasWorkout = workouts.containsKey(date.day);
    final Color textColor = hasWorkout ? Colors.white : const Color(0xFF5D607C);

    return DragTarget<Workout>(
      onAccept: (receivedWorkout) {
        setState(() {
          workouts.removeWhere((key, value) => value.title == receivedWorkout.title);
          workouts[date.day] = receivedWorkout;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF282A39)))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat('E').format(date), style: GoogleFonts.mulish(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w700)),
                    Text("${date.day}", style: GoogleFonts.mulish(color: textColor, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              if (hasWorkout)
                Expanded(
                  child: Draggable<Workout>(
                    data: workouts[date.day]!,
                    feedback: SizedBox(
                      width: 0.8.sw,
                      child: Opacity(
                          opacity: 0.8,
                          child: WorkoutCard(workout: workouts[date.day]!)
                      ),
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: WorkoutCard(workout: workouts[date.day]!),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildHeaderSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Training Calendar", style: GoogleFonts.mulish(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.white)),
              GestureDetector (
                onTap: isSaving ? null : _saveWorkouts,
                child: isSaving
                    ? SizedBox(  width: 20.w, height: 20.h, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : Text("Save", style: GoogleFonts.mulish(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white)),
              ),

            ],
          ),
        ),
        Container(height: 2.h, color: const Color(0xFF4855DF)),
      ],
    );
  }
}