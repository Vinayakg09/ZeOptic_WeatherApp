import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeoptic_weather/view/Home/bloc/weather_bloc.dart';

class MySearchbar extends StatelessWidget {
  final TextEditingController cityController;
  const MySearchbar({required this.cityController, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cityController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Enter City Name',
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: const Icon(Icons.search),
        suffixIconColor: Colors.white,
        fillColor: Colors.white.withOpacity(0.2),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.2), width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onSubmitted: (value) {
        BlocProvider.of<WeatherBloc>(context)
            .add(FetchWeather(cityName: value));
      },
    );
  }
}
