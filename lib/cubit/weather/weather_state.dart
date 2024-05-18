part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

@immutable
final class WeatherInitial extends WeatherState {
  final bool isCelcius;
  final String temperature;

  WeatherInitial({
    required this.isCelcius,
    required this.temperature,
  });

  WeatherInitial copyWith({
    bool? isCelcius,
    String? temperature,
  }) {
    return WeatherInitial(
      isCelcius: isCelcius ?? this.isCelcius,
      temperature: temperature ?? this.temperature,
    );
  }
}
