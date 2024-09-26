import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeoptic_weather/view/Home/bloc/weather_bloc.dart';
import 'package:zeoptic_weather/model/weather_model.dart';
import 'package:zeoptic_weather/view/widgets/currentWeather.dart';
import 'package:zeoptic_weather/view/widgets/hourlyForecast.dart';
import 'package:zeoptic_weather/view/widgets/searchBar.dart';
import 'package:zeoptic_weather/view/widgets/sunrise_sunset.dart';
import 'package:zeoptic_weather/view/widgets/uvIndex.dart';

class WeatherDashboard extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();
  final String cityName = "London";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8E97FD), Color(0xFF6E78FF)],
          ),
        ),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherInitial) {
              BlocProvider.of<WeatherBloc>(context)
                  .add(FetchWeather(cityName: cityName));
            }
            if (state is WeatherError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is WeatherLoaded) {
              WeatherModel weather = state.weatherData;

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MySearchbar(cityController: cityController),
                      const SizedBox(height: 30),
                      MyCurrentWeather(weather),
                      const SizedBox(height: 30),
                      MyHourlyForecast(weather.hourlyWeather),
                      const SizedBox(height: 30),
                      MySunriseSunset(weather.sunriseTime, weather.sunsetTime),
                      const SizedBox(height: 20),
                      MyUVIndex(weather.uvIndex),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
