import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/resources/components.dart';

import '../business_logic/login_cubit/weather__cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  var weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(Icons.search),
              ),
            ],
            title: Text('Weather App'),
          ),
          body: ConditionalBuilder(
            condition: state is WeatherSuccessState,
            //WeatherCubit.get(context).weatherModel.consolidatedWeather!.isEmpty,
            builder: (context) =>Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  WeatherCubit.get(context).getThemeColor(),
                  WeatherCubit.get(context).getThemeColor()[300]!,
                  WeatherCubit.get(context).getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                Column(
                  children: [
                    Text(
                      WeatherCubit.get(context).weatherModel.title!
                          .toUpperCase(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Time Zone: ${WeatherCubit.get(context).weatherModel.timezone}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(WeatherCubit.get(context).getImage()),
                    Text(
                      WeatherCubit.get(context).weatherModel.consolidatedWeather![0].theTemp!.toInt().toString(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Max Temp: ${  WeatherCubit.get(context).weatherModel.consolidatedWeather![0].maxTemp!.toInt()}"),
                        Text("Min Temp: ${  WeatherCubit.get(context).weatherModel.consolidatedWeather![0].minTemp!.toInt()}"),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  '${WeatherCubit.get(context).weatherModel.consolidatedWeather![0].weatherStateName}',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 9),
              ],
            ),
          ),
            fallback: (context) =>  Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
