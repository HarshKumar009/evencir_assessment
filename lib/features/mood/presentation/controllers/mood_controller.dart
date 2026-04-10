import 'package:flutter/material.dart';
import '../../data/local/mood_local_data.dart';
import '../../domain/models/mood_model.dart';

class MoodController extends ChangeNotifier {
  int _selectedMoodIndex = 0;

  int get selectedMoodIndex => _selectedMoodIndex;

  MoodModel get currentMood => MoodLocalData.moods[_selectedMoodIndex];

  void nextMood() {
    _selectedMoodIndex = (_selectedMoodIndex + 1) % MoodLocalData.moods.length;
    notifyListeners();
  }
}