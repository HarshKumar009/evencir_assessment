import 'mood_type.dart';

class MoodModel {
  final MoodType type;
  final String title;
  final String assetPath;
  final double pointerAngle;

  const MoodModel({
    required this.type,
    required this.title,
    required this.assetPath,
    required this.pointerAngle,
  });
}