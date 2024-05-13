import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mero_weather/models/weather_model.dart';

class WeatherDetailsRepo {
  //----------------------------------Fetching Weather Details-------------------------------------
  Future<WeatherModel> fetchWeatherDetails(String location) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=0d59382e6b914b109e9140136241205&q=$location&days=6&aqi=no&alerts=no",
          //!Hide the API key later on
        ),
      );
      if (response.statusCode == 200) {
        WeatherModel weatherDetailsModel =
            weatherModelFromJson(response.body.toString());
        return weatherDetailsModel;
      } else {
        throw Exception("Failed to Load Weather Details");
      }
    } catch (e) {
      log("Exception caught: $e");
    }
    throw Exception("Outer Exception: Failed to Load Weather Details ");
  }
}
