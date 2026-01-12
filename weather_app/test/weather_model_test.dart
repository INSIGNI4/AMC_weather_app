import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart'; // Adjust the import path based on your project structure

void main() {
  group('Weather.fromJson', () {
    test('should correctly parse a valid JSON response from OpenWeatherMap', () {
      // A realistic sample JSON response from OpenWeatherMap for Manila, PH
      const String jsonString = '''
      {
        "coord": {
          "lon": 120.9822,
          "lat": 14.6042
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 302.11,
          "feels_like": 307.11,
          "temp_min": 301.09,
          "temp_max": 302.66,
          "pressure": 1010,
          "humidity": 80
        },
        "visibility": 10000,
        "wind": {
          "speed": 2.57,
          "deg": 130
        },
        "clouds": {
          "all": 75
        },
        "dt": 1661834400,
        "sys": {
          "type": 1,
          "id": 8160,
          "country": "PH",
          "sunrise": 1661809603,
          "sunset": 1661854228
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      }
      ''';

      // 1. Decode the JSON string into a Map
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // 2. Call the Weather.fromJson factory constructor
      final Weather weather = Weather.fromJson(jsonMap);

      // 3. Assert that the created Weather object has the correct properties
      expect(weather.city, 'Manila');
      expect(weather.temperature, 302.11);
      expect(weather.description, 'Clouds');
      // expect(weather.icon, '04d');
      expect(weather.humidity, 80);
      expect(weather.windSpeed, 2.57);
    });
  });
}
