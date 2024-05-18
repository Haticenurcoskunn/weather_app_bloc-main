import 'package:flutter/material.dart';
import 'package:weather_app_bloc/cubit/weather/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/presentation/screen/settings_page.dart';
import '../../cubit/settings/settings_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherCubit()..fetchTemperature()),
        BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (state as WeatherInitial).temperature,
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        state.isCelsius ? "°C" : "°F",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );

                if (result != null && result is bool) {
                  context
                      .read<WeatherCubit>()
                      .toggleTemperatureUnit(isCelsius: result);
                }
              },
              child: const Icon(Icons.settings),
            ),
          );
        },
      ),
    );
  }
}
