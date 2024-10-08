part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String cityName;

  FetchWeather({required this.cityName});
}
