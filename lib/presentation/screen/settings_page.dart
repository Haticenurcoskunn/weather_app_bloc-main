import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubit/settings/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final isCelsius =
                (context.read<SettingsCubit>().state as SettingsInitial)
                    .isCelsius;
            Navigator.pop(context, isCelsius);
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, settingsState) {
            return Column(
              children: [
                Text((settingsState as SettingsInitial).isCelsius
                    ? "Celsius"
                    : "Fahrenheit"),
                ElevatedButton(
                  onPressed: () {
                    context.read<SettingsCubit>().toggleTemperatureUnit();
                  },
                  child: const Text("Change"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
