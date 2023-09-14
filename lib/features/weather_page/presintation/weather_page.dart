import 'package:dio_example/features/weather_page/presintation/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(GetWeatherEvent()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Image.asset((state.weatherResponse?.weather?[0]) != null
                      ? 'assets/cloudy_image.png'
                      : ''),
                  Text(
                    '${((state.weatherResponse?.main?.temp ?? 0) - 32) * 5 / 10}.C',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    state.weatherResponse?.name ?? '',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
