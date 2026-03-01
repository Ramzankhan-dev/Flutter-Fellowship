import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo_app/modals/Weather.dart';

class WeatherService {

  final String apiKey = "505f193dc8127ec4a0a8b0e037e0337a";

  Future<Weather> fetchWeather(String city) async {

    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric"
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