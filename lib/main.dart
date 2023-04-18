import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/Weather_Provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: weather_app()));
}

class weather_app extends StatelessWidget {
  const weather_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getcolor()  ,
      ),
     
      debugShowCheckedModeBanner: false,
      home: home_page(),
    );
  }
}
