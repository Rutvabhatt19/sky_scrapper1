import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sky_scrapper/Homepage.dart';
import 'package:sky_scrapper/WeatherDataModal.dart';

class APIprovider extends ChangeNotifier {
  late WeatherDataModal _weatherDataModal = WeatherDataModal(
    location: Location(
        name: '',
        region: '',
        country: '',
        lat: 0.0,
        lon: 0.0,
        tzId: '',
        localtimeEpoch: 0,
        localtime: ''),
    current: Current(
      lastUpdatedEpoch: 0,
      lastUpdated: '',
      tempC: 0.0,
      tempF: 0.0,
      isDay: 0,
      condition: Condition(text: '', icon: '', code: 0),
      windMph: 0.0,
      windKph: 0.0,
      windDegree: 0,
      windDir: '',
      pressureMb: 0.0,
      pressureIn: 0.0,
      precipMm: 0.0,
      precipIn: 0.0,
      humidity: 0,
      cloud: 0,
      feelslikeC: 0.0,
      feelslikeF: 0.0,
      visKm: 0,
      visMiles: 0,
      uv: 0,
      gustMph: 0.0,
      gustKph: 0.0,
    ),
    forecast: Forecast(forecastday: []),
  );
  WeatherDataModal get weatherDataModal => _weatherDataModal;

  Future<void> Foruri() async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=a86fa895e3fe4a5ba9c31948232111&q&q=$a&days=1&aqi=no&alerts=no');
    var response = await get(url);

    if (response.statusCode == 200) {
      print("responsee <<<< ${response.body}");
      Map<String, dynamic> jsonmap = json.decode(response.body);
      Location location = Location.fromJson(jsonmap['location'] ?? {});
      Current current = Current.fromJson(jsonmap['current'] ?? {});
      Forecast forecast = Forecast.fromJson(jsonmap['forecast'] ?? {});
      notifyListeners();
      print(forecast.forecastday);
      print(forecast.forecastday[0].astro.sunset);

      _weatherDataModal = WeatherDataModal(
          location: location, current: current, forecast: forecast);
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
