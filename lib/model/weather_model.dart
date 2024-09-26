class WeatherModel {
  final String location;
  final String condition;
  final double temperature;
  final double highTemperature;
  final double lowTemperature;
  final String currentTime;
  final List<HourlyWeather> hourlyWeather;
  final String sunriseTime;
  final String sunsetTime;
  final String uvIndex;

  WeatherModel({
    required this.location,
    required this.condition,
    required this.temperature,
    required this.highTemperature,
    required this.lowTemperature,
    required this.currentTime,
    required this.hourlyWeather,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.uvIndex,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var hourlyList = (json['forecast']['forecastday'][0]['hour'] as List)
        .map((hour) => HourlyWeather.fromJson(hour))
        .toList();

    return WeatherModel(
      location: json['location']['name'],
      condition: json['current']['condition']['text'],
      temperature: json['current']['temp_c'].toDouble(),
      highTemperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      lowTemperature: json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
      currentTime: json['location']['localtime'],
      hourlyWeather: hourlyList,
      sunriseTime: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunsetTime: json['forecast']['forecastday'][0]['astro']['sunset'],
      uvIndex: json['current']['uv'].toString(),
    );
  }
}

class HourlyWeather {
  final String time;
  final double temp;
  final String condition;

  HourlyWeather({
    required this.time,
    required this.temp,
    required this.condition,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      time: json['time'],
      temp: json['temp_c'].toDouble(),
      condition: json['condition']['text'],
    );
  }
}
