import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherRepository {
  Future<Map<String, dynamic>> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
            'http://api.weatherapi.com/v1/forecast.json?key=5027cf11def14de9a57183913232108&q=$cityName'),
      );
      final data = jsonDecode(res.body);

      if (data == 'null') {
        throw 'An unexcepted error occur';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
