import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/api/dio_helper.dart';
import '../../data/models/WeatherModel.dart';
import '../../resources/strings_manager.dart';

part 'weather__state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);
  late WeatherModel weatherModel;
  //var cubit = WeatherCubit.get(context);
  Future<int> getCityId({required String cityName}) async {
    //msh fahem leh hena city id hy il return type
    int cityId = 0;
    await DioHelper.getData(
      url: "${AppStrings.Location}/search",
      query: {"query": cityName},
    ).then((value) {
    //  weatherModel = WeatherModel.fromJson(value);

    cityId = value.length != 0 ? value[0]['woeid'] : 0;
    }).catchError((error) {
      print("Get City Id Exception : $error");
    });
    return cityId;
  }
  Future<void> getWeatherData({required String cityName}) async {
    print('start of poggggg');

    int id = await getCityId(cityName: cityName);
    DioHelper.getData(
        url: 'location/$id'
    ).then((json) {
      weatherModel = WeatherModel.fromJson(json);
      print(weatherModel.consolidatedWeather![0].maxTemp);
      print(weatherModel.consolidatedWeather![0].minTemp);
      emit(WeatherSuccessState());
      print('YA SALAAAAAAM HWA DH EL KALAAAM EL TAMAAAAM');
    }).catchError((error) {
      print(' ERROR');
      print(error.toString());
      emit(WeatherErrorState());
    });
  }
  MaterialColor getThemeColor() {
    if (weatherModel.consolidatedWeather![0].weatherStateName == "Thunderstorm" || weatherModel.consolidatedWeather![0].weatherStateName == "Thunder")
      return Colors.yellow;
    else if (weatherModel.consolidatedWeather![0].weatherStateName == "Sleet" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Hail" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Snow")
      return Colors.blue;
    else if (weatherModel.consolidatedWeather![0].weatherStateName == "Light Rain" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Heavy Rain" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Showers")
      return Colors.blue;
    else if (weatherModel.consolidatedWeather![0].weatherStateName == "Heavy Cloud")
      return Colors.blueGrey;
    else
      return Colors.orange;
  }
  String getImage() {
    if (weatherModel.consolidatedWeather![0].weatherStateName == "Thunderstorm" || weatherModel.consolidatedWeather![0].weatherStateName == "Thunder")
      return "assets/images/thunderstorm.png";
    else if (weatherModel.consolidatedWeather![0].weatherStateName == "Sleet" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Hail" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Snow")
      return "assets/images/snow.png";
    else if (weatherModel.consolidatedWeather![0].weatherStateName == "Light Rain" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Heavy Rain" ||
        weatherModel.consolidatedWeather![0].weatherStateName == "Showers")
      return "assets/images/rainy.png";
    else if (weatherModel.consolidatedWeather![0].weatherStateName == "Heavy Cloud")
      return "assets/images/cloudy.png";
    else
      return "assets/images/clear.png";
  }


//   static LoginCubit get(context) => BlocProvider.of(context);

//   void userRegister({
//     required String name,
//     required String phone,
//     required String email,
//     required String password,
//   }) {
//     emit(RegisterLoading());
//     DioHelper.postData(url: Register, data: {
//       'name': name,
//       'phone': phone,
//       'email': email,
//       'password': password,
//     }).then((value) {
//       loginModel = ShopLoginModel.fromJson(value.data);
//       print(loginModel.message);
//       emit(RegisterSuccess(loginModel));
//     }).catchError((error) {
//       print(error.toString());
//       emit(RegisterError(error));
//     });
//   }
//
// }
//
}
