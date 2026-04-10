import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';import '../../../mood/presentation/pages/mood_page.dart';

import '../../../plan/presentation/pages/plan_page.dart';
import '../providers/bottom_nav_provider.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_page.dart';


class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  final List<Widget> _screens = const [
    HomePage(),
    PlanPage(),
    MoodPage(),
    Center(child: Text("Profile Screen", style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}