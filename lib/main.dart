import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_weather/config/app_constants.dart';
import 'package:mero_weather/cubit/weather_details_cubit.dart';
import 'package:mero_weather/repo/weather_details_repo.dart';
import 'package:mero_weather/routes/app_route_config.dart';
import 'package:mero_weather/themes/dark_theme.dart';
import 'package:mero_weather/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherDetailsCubit(WeatherDetailsRepo()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: MeroAppRouter().router,
        title: AppConstants.appName,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        // themeMode: ThemeMode.dark,
      ),
    );
  }
}
