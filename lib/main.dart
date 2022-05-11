import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/login_cubit/weather__cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'business_logic/cubit/cubit_observer.dart';
import 'data/api/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(
    WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   // var weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return MultiBlocProvider(
        providers: [
        BlocProvider(

        create: (BuildContext context) => WeatherCubit()
    ),
      ],

      child: MaterialApp(
        // theme: ThemeData(
        //   primarySwatch:
        //       weatherData == null ? Colors.blue : weatherData.getThemeColor(),
        // ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
