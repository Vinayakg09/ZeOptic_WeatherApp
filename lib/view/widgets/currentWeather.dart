import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeoptic_weather/model/weather_model.dart';
import 'package:zeoptic_weather/view/widgets/Icons.dart';

class MyCurrentWeather extends StatelessWidget {
  final WeatherModel weather;
  const MyCurrentWeather(this.weather, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            weather.location,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Current Location',
            style: GoogleFonts.roboto(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(getWeatherIcon(weather.condition),
                  color: getIconColor(weather.condition), size: 80),
              const SizedBox(width: 10),
              Text(
                '${weather.temperature.round()}°',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weather.condition,
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                " - ",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'H:${weather.highTemperature.round()}° L:${weather.lowTemperature.round()}°',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
