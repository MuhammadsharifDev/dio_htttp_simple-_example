import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio_example/features/weather_page/data/model/get_weather_response.dart';
import 'package:dio_example/features/weather_page/domain/weather_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState()) {
    on<GetWeatherEvent>(_getUsers);
  }
  final _weatherRepository=WeatherRepository();
  Future<void> _getUsers(GetWeatherEvent event,
      Emitter<WeatherState> emit) async {
    final result = await _weatherRepository.getWeather();

    emit(state.copyWith(weatherResponse: result));
  }
}
