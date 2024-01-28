import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/weather_cubit/weatherStates.dart';
import 'package:my_app/models/weather_model.dart';
import 'package:my_app/services/weather_service.dart';
class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherService) : super(weatherInitial());


  WeatherService weatherService;

  WeatherModel? weatherModel;

  void getweather({required String cityName}) async{
    emit(weatherLoading());
    try{
      weatherModel= await weatherService.getWeather(cityName: cityName);
      emit(weatherSuccess());
    } on Exception catch(e) {
      emit(weatherFailure());
    }

  }
}