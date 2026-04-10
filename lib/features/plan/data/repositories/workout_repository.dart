import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/workout_model.dart';

class WorkoutRepository {
  static Future<void> saveWorkouts(Map<int, Workout> workouts) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {};
    workouts.forEach((day, w) => data[day.toString()] = {
      'type': w.type, 'title': w.title, 'time': w.time, 'color': w.colorValue
    });
    await prefs.setString('workouts', jsonEncode(data));
  }

  static Future<Map<int, Workout>> loadWorkouts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('workouts');
    if (data == null) return {};
    Map<String, dynamic> decoded = jsonDecode(data);
    return decoded.map((k, v) => MapEntry(int.parse(k), Workout(
        type: v['type'], title: v['title'], time: v['time'], colorValue: v['color']
    )));
  }
}