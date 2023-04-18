import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/Weather_Provider.dart';

import '../services/weather_services.dart';

class search extends StatelessWidget {
  // search({this.updateUi});
  // VoidCallback? updateUi;
  String? CityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
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
              label: Text("Search"),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 24),
              border: OutlineInputBorder(),
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
                child: Icon(Icons.search)),
              hintText: "Please Enter a City",
            ),
          ),
        ),
      ),
    );
  }
}
