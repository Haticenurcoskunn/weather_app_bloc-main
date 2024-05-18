import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial(isCelsius: true));

  void toggleTemperatureUnit() {
    final currentState = state;
    if (currentState is SettingsInitial) {
      emit(SettingsInitial(isCelsius: !currentState.isCelsius));
    }
  }
}
