import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_services.dart';

import 'cubits/weather_cubits/weather_cubit.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch:
          BlocProvider.of<WeatherCubit>(context).weatherModel == null
              ? Colors.blue
              : BlocProvider.of<WeatherCubit>(context)
                  .weatherModel!
                  .getThemeColor(),
          ),
      home: HomeScreen(),
    );
  }
}
