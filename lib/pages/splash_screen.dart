import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mero_weather/routes/app_route_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool skipValue = false;

  @override
  void initState() {
    getSkipValue();
    Future.delayed(const Duration(seconds: 2), () {
      skipValue
          ? GoRouter.of(context).pushReplacementNamed(
              MyAppRouteConstants.homePage,
            )
          : GoRouter.of(context).pushReplacementNamed(
              MyAppRouteConstants.helpScreen,
            );
    });
    super.initState();
  }

  Future<void> getSkipValue() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool value = sp.getBool("skip") ?? false;
    setState(() {
      skipValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
