import 'package:flutter/material.dart';

IconData getWeatherIcon(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Icons.wb_sunny; 
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Icons.wb_cloudy; 
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Icons.blur_on; 
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
      return Icons.grain; 
    case 'freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Icons.ac_unit; 
    case 'thundery outbreaks possible':
    
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Icons.flash_on; 
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
      return Icons.ac_unit; 
    case 'blizzard':
    case 'blowing snow':
      return Icons.ac_unit; 
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Icons.ac_unit; 
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Icons.grain; 
    case 'stormy':
      return Icons.flash_on; 
    default:
      return Icons.cloud; 
  }
}

Color getIconColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.yellow;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
      return Colors.lightBlue;
    case 'freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.cyanAccent;
    case 'thundery outbreaks possible':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.orangeAccent;
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'blizzard':
    case 'blowing snow':
      return Colors.blueAccent;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'ice pellets':
      return Colors.lightBlueAccent;
    case 'stormy':
      return Colors.deepOrange;
    default:
      return Colors.white; 
  }
}
