import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';
import '../models/weather.dart';


class WeatherService {
  static const String apiKey = "c655a9adc5db90fd694f96ca3ff1b4b4";
  static const String apiURL = "https://api.openweathermap.org/data/2.5/weather";

static Future<Weather> getWeather(String cityName) async {
  try {
    String url = '$apiURL?q=$cityName&appid=$apiKey&units=metric';

    if (kIsWeb) {
      url = 'https://corsproxy.io/?${Uri.encodeComponent(url)}';
    }
    final http.Response response = await http.get(Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Weather.fromJson(data);
    }
    else if (response.statusCode == 401) {
      throw Exception('City not found');
    }
    else {
      throw Exception('Failed to load weather data. Status ${response.statusCode}');

    }

  }
  catch(e) {
    throw Exception('Error fetching weather data: $e');
  }
}
}