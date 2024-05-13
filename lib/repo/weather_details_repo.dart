import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mero_weather/models/1.dart';

class WeatherDetailsRepo {
  //----------------------------------Fetching Movie Details-------------------------------------
  Future<WeatherModel> fetchWeatherDetails(String location) async {
    // Map<String, String> headers = {
    //   'accept': 'application/json',
    //   "Authorization": "Bearer $accessToken",
    // };
    try {
      http.Response response = await http.get(
        Uri.parse(
          // "https://api.weatherapi.com/v1/current.json?key=0d59382e6b914b109e9140136241205&q=kathmandu&aqi=yes",
          "https://api.weatherapi.com/v1/current.json?key=0d59382e6b914b109e9140136241205&q=$location&aqi=yes",
          //!Hide the API key later on
        ),
        // headers: headers,
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
