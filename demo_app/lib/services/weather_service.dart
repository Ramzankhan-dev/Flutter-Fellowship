import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo_app/modals/Weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';

  Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric",
    );

    final response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
