part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}
class GetWeatherEvent extends WeatherEvent{
  GetWeatherEvent();
  List<Object?> get props=>[];
}