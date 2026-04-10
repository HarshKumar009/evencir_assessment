import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/weather_repository.dart';

final temperatureProvider = FutureProvider<double>((ref) async {
  final weatherRepo = ref.watch(weatherRepositoryProvider);
  return weatherRepo.getCurrentTemperature();
});