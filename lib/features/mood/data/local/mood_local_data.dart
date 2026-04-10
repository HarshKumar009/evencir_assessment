import '../../domain/models/mood_model.dart';
import '../../domain/models/mood_type.dart';

class MoodLocalData {
  static const List<MoodModel> moods = [
    MoodModel(
      type: MoodType.calm,
      title: 'Calm',
      assetPath: 'assets/icons/calm.png',
      pointerAngle: -0.5,
    ),
    MoodModel(
      type: MoodType.content,
      title: 'Content',
      assetPath: 'assets/icons/content.png',
      pointerAngle: 0.95,
    ),
    MoodModel(
      type: MoodType.peaceful,
      title: 'Peaceful',
      assetPath: 'assets/icons/peace.png',
      pointerAngle: 2.20,
    ),
    MoodModel(
      type: MoodType.happy,
      title: 'Happy',
      assetPath: 'assets/icons/happy.png',
      pointerAngle: -2.20,
    ),
  ];
}