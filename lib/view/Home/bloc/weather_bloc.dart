import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:zeoptic_weather/controller/weather_repository.dart';
import 'package:zeoptic_weather/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>(
      (event, emit) async {
        emit(WeatherLoading());
        try {
          final data =
              await weatherRepository.getCurrentWeather(event.cityName);
          final result = WeatherModel.fromJson(data);
          emit(WeatherLoaded(result));
        } catch (e) {
          emit(WeatherError(e.toString()));
        }
      },
    );
  }
}
