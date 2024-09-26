import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeoptic_weather/controller/weather_repository.dart';
import 'package:zeoptic_weather/view/Home/bloc/weather_bloc.dart';
import 'package:zeoptic_weather/view/Home/page/weatherDashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    final weatherRepository = WeatherRepository();
    return BlocProvider(
      create: (context) {
        final bloc = WeatherBloc(weatherRepository);
        bloc.add(FetchWeather(cityName: "London"));
        return bloc;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WeatherDashboard(),
      ),
    );
  }
}
