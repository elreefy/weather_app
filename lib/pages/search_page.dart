import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/login_cubit/weather__cubit.dart';
import 'package:weather_app/pages/home_page.dart';
//import 'package:weather_app/models/weather_model.dart';
//import 'package:weather_app/providers/weather_provider.dart';
import '../resources/components.dart';
import '../resources/values_manager.dart';
//import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            title: Text(
              "Search a City",
            ),
          ),
          body: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter City Name....",
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p25,
                ),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (city) async {
                await WeatherCubit.get(context).getWeatherData(cityName: city);
                Navigator.pop(context);
                // Provider.of<WeatherProvider>(context, listen: false).cityName =
                //     city;
                // WeatherModel weatherModel =
                // await WeatherService.getWeather(cityName: city);
                // Provider.of<WeatherProvider>(context, listen: false).weatherData =
                //     weatherModel;
                //
              },
            ),
          ),
        );
      },
    );

    // Container(child: Center(
    //     child: primaryButton(text: 'get cairo data', onPressed: () {
    //       WeatherCubit.get(context).getWeatherData(cityName: 'cairo').
    //       then((value) =>navigateAndFinish(context, HomePage()) );
    //     })),);
  }
}
