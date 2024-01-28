import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:my_app/models/weather_model.dart';
import 'package:my_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  final void Function(String cityName)? onCitySelected;
  final VoidCallback? updateUi;
  String? cityName;

  SearchPage({this.onCitySelected, this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                BlocProvider.of<WeatherCubit>(context).getweather(cityName: cityName!);
                Navigator.pop(context);
                if (updateUi != null) {
                  updateUi!();
                }
                if (onCitySelected != null) {
                  onCitySelected!(cityName!);
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                labelText: 'Search',
                suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weather = await service.getWeather(cityName: cityName!);
                    BlocProvider.of<WeatherCubit>(context).getweather(cityName: cityName!);
                    Navigator.pop(context);
                    if (updateUi != null) {
                      updateUi!();
                    }
                    if (onCitySelected != null) {
                      onCitySelected!(cityName!);
                    }
                  },
                  child: Icon(Icons.search),
                ),
                border: OutlineInputBorder(),
                hintText: 'Enter a city',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

