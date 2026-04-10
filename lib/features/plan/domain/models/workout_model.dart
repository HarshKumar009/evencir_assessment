import 'package:flutter/material.dart';

class Workout {
  final String type;
  final String title;
  final String time;
  final int colorValue;

  Workout({required this.type, required this.title, required this.time, required this.colorValue});
  Color get color => Color(colorValue);
}