import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/weather_cubit/weatherStates.dart';
import 'package:my_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:my_app/models/weather_model.dart';
import 'package:my_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    onCitySelected: (cityName) {
                      this.cityName = cityName;
                    },
                  );
                }),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Search Weather'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is weatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is weatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[300]!,
                    weatherData!.getThemeColor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    cityName ?? 'Unknown City',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Updated at: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Image.asset(weatherData!.getImage()),
                      ),
                      Expanded(
                        child: Text(
                          weatherData!.temp.toInt().toString(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'maxTemp: ${weatherData!.maxTemp.toInt()}',
                            ),
                            Text(
                              'minTemp: ${weatherData!.minTemp.toInt()}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    weatherData!.weatherStateName,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(flex: 5),
                ],
              ),
            );
          } else if (state is weatherFailure) {
            return Center(child: Text('Something went wrong, please try again'));
          } else {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/background3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 150, left: 16), // Adjust the values as per your preference
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Forecast Weather',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Search now 🔍',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}