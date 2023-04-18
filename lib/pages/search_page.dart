// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/Weather_Provider.dart';

import '../services/weather_services.dart';

class search extends StatelessWidget {
  // search({this.updateUi});
  // VoidCallback? updateUi;
  String? CityName;

  search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;
              WeatherServices services = WeatherServices();
              WeatherModels weather =
                  await services.getWeather(CityName: CityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).CityName =
                  CityName;
              //updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: const Text("Search"),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 35, horizontal: 24),
              border: const OutlineInputBorder(),
              suffixIcon: GestureDetector(onTap: ()async {
                    WeatherServices services = WeatherServices();
              WeatherModels weather =
                  await services.getWeather(CityName: CityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).CityName =
                  CityName;
              //updateUi!();
              Navigator.pop(context);
              },
                child: const Icon(Icons.search)),
              hintText: "Please Enter a City",
            ),
          ),
        ),
      ),
    );
  }
}
