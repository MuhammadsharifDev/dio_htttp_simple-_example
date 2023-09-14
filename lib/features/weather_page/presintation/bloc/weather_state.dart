part of 'weather_bloc.dart';

@immutable
class WeatherState extends Equatable {
  final GetWeatherResponse? weatherResponse;

  const WeatherState({
    this.weatherResponse,
  });

  WeatherState copyWith({
    GetWeatherResponse? weatherResponse,
  }) {
    return WeatherState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
    );
  }

  @override
  List<Object?> get props => [weatherResponse];
}
