import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zeoptic_weather/model/weather_model.dart';
import 'package:zeoptic_weather/view/widgets/Icons.dart';

class MyHourlyForecast extends StatelessWidget {
  final List<HourlyWeather> hourlyWeather;
  const MyHourlyForecast(this.hourlyWeather, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather.length,
        itemBuilder: (context, index) {
          final hourly = hourlyWeather[index];
          return _buildHourlyItem(
              hourly.time,
              getWeatherIcon(hourlyWeather[index].condition),
              getIconColor(hourlyWeather[index].condition),
              '${hourly.temp.round()}°');
        },
      ),
    );
  }
}

Widget _buildHourlyItem(
    String time,
    IconData icon,
    Color color,
    String temp,
  ) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(extractTime(time),
              style: GoogleFonts.roboto(color: Colors.white)),
          Icon(icon, color: color),
          Text(temp, style: GoogleFonts.roboto(color: Colors.white)),
        ],
      ),
    );
  }

  String extractTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  String formattedTime = DateFormat('HH:mm').format(dateTime);

  return formattedTime;
}
