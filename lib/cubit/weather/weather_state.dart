part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

@immutable
final class WeatherInitial extends WeatherState {
  final bool isCelsius;
  final String temperature;

  WeatherInitial({
    required this.isCelsius,
    required this.temperature,
  });

  WeatherInitial copyWith({
    bool? isCelsius,
    String? temperature,
  }) {
    return WeatherInitial(
      isCelsius: isCelsius ?? this.isCelsius,
      temperature: temperature ?? this.temperature,
    );
  }
}
