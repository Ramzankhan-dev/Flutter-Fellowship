import 'package:flutter/material.dart';
import 'package:demo_app/modals/Weather.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  final WeatherService weatherService = WeatherService();
  final TextEditingController cityController = TextEditingController();

  Weather? weather;
  bool isLoading = false;
  String? errorMessage;

  void getWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result = await weatherService.fetchWeather(
        cityController.text.trim(),
      );

      setState(() {
        weather = result;
        isLoading = false;
      });

    } catch (e) {
      setState(() {
        errorMessage = "City not found or network error";
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: "Enter City Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            ElevatedButton(
              onPressed: getWeather,
              child: Text("Get Weather"),
            ),

            SizedBox(height: 20),

            if (isLoading)
              CircularProgressIndicator(),

            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),

            if (weather != null)
              Column(
                children: [
                  Text(
                    weather!.cityName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${weather!.temperature} °C",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(weather!.description),
                  Text("Humidity: ${weather!.humidity}%"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}