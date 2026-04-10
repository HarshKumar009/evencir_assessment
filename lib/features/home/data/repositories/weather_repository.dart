import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class WeatherRepository {
  Future<double> getCurrentTemperature();
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<double> getCurrentTemperature() async {
    await Future.delayed(const Duration(seconds: 1));
    return 5 + Random().nextDouble() * 20;
  }
}

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return FakeWeatherRepository();
});