import 'package:http/http.dart';
import 'dart:convert';

class SnowReport {
  // Basic properties
  String resort; // friendly name of resort
  String flag; // country flag associated with resort
  String snowfallUrl;
  String currentWeatherUrl;
//  String forecastWeatherUrl;
  // Snowfall report
  String snowfall24; // snowfall in last 24 hours
  String snowfall48; // snowfall in last 48 hours
  String snowfall72; // snowfall in last 72 hours
  // Current weather
//  String temperature; // current temperature
  String snowDescription; // current snow conditions description at resort
  // Forecast weather
  String snowfallPrediction; // predicted snowfall for today
  // TODO: MOAR WEATHER

  SnowReport({ this.resort, this.flag, this.snowfallUrl, this.currentWeatherUrl });

  Future<int> getReport() async {

    Future<Map> fetchData(String resortUrl) async {
      String apiUrl = 'http://192.168.1.13:5000/snow_report/' + resortUrl + '?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoibHVrZSJ9.khTVx76bVfvmSz3FcRfvLtM7p0r0wQ2bunArjvaBzqo';
      Response response = await get(
        apiUrl,
        headers: {'Accept': 'application/json'},
      );
      print(apiUrl);
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        // OK response, parse the JSON data
        return json.decode(response.body);
      }
        return null;
    }

    bool debug = false;
    Map snowfallData;
    try {
      if (debug) {
        snowDescription = 'Packed powder';
        snowfall24 = '0.0';
        snowfall48 = '4.7';
        snowfall72 = '8.3';
        snowfallPrediction = '0.0';
      }
      else {
        snowfallData = await fetchData(this.snowfallUrl).timeout(Duration(seconds: 2));
        if (snowfallData == null) {
          return 1;
        }
        print('got:');
        print(snowfallData);
      }
        // get properties from snowfall data
        print('setting properties!');
        snowDescription = snowfallData['snowDescription'];
        snowfall24 = snowfallData['snowfall24'];
        snowfall48 = snowfallData['snowfall48'];
        snowfall72 = snowfallData['snowfall72'];
        snowfallPrediction = snowfallData['todaySnowForecast'];
        // make request for current weather data
        // get properties from current weather data
        // make request for forecast weather data
        // get properties from forecast weather data
      return 0;
      }

    catch (e) {
      print('Caught error: $e');
    }
    return 1;
  }

}