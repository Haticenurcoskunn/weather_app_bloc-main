part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

@immutable
final class SettingsInitial extends SettingsState {
  final bool isCelsius;

  SettingsInitial({required this.isCelsius});
}
