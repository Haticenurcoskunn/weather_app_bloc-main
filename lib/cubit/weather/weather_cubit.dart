import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../fakedata.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial(isCelsius: true, temperature: "0"));

  void toggleTemperatureUnit({required bool isCelsius}) {
    final currentState = state;
    if (currentState is WeatherInitial) {
      emit(WeatherInitial(
        isCelsius: isCelsius,
        temperature: currentState.temperature,
      ));
    }
  }

  void fetchTemperature() {
    final currentState = state;
    if (currentState is WeatherInitial) {
      final fakeData = FakeData.getFakeData();
      final temperature = fakeData.keys.first;
      emit(WeatherInitial(
        isCelsius: fakeData[temperature]!,
        temperature: temperature,
      ));
    }
  }

  WeatherState copyWith({
    bool? isCelsius,
    String? temperature,
  }) {
    return WeatherInitial(
      isCelsius: isCelsius ?? (state as WeatherInitial).isCelsius,
      temperature: temperature ?? (state as WeatherInitial).temperature,
    );
  }
}
