import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import '../providers/Weather_Provider.dart';

class home_page extends StatefulWidget {
  home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  WeatherModels? weatherData;

  @override
  // void updateUi() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return search(
                    //  updateUi: updateUi,
                    );
              }));
            },
            icon: Icon(Icons.search),
          )
        ],
        title: Text('Weather App'),
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "the weather is not good",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "Searching Now 🧐🧐",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getcolor(),
                weatherData!.getcolor()[300]!,
                weatherData!.getcolor()[100]!,
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).CityName!,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'update at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        "${weatherData!.temp.toInt()}",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "maxTemp:${weatherData!.maxtemp.toInt()} ",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "minTemp:${weatherData!.mintemp.toInt()}",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData!.weatherstate,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
