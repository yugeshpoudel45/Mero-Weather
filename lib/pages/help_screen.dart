import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mero_weather/config/app_local_assets.dart';
import 'package:mero_weather/routes/app_route_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  HelpScreenState createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> {
  bool skipValue = false;
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      GoRouter.of(context).pushReplacement(
        MyAppRouteConstants.homePage,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.sizeOf(context);
    TextTheme myTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.frame2),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.onboard1,
                    height: mySize.height / 3,
                  ),
                  SizedBox(height: mySize.height / 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Welcome to Mero Weather',
                      textAlign: TextAlign.center,
                      style: myTextTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'We show weather for you',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.maxFinite,
                    child: GestureDetector(
                      onTap: () {
                        skipButtonPressed(true);
                        GoRouter.of(context).pushReplacement(
                          MyAppRouteConstants.homePage,
                        );
                      },
                      child: const Text(
                        "Skip",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //------------------------------------------Shared Preferences Section----------------------------------
  Future<void> skipButtonPressed(bool skipValue) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("skip", skipValue);
  }
}
