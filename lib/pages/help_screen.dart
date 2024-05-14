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
  Timer? _timer;

  @override
  void initState() {
    checkSkipStatus();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
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
                      "We show weather for you, keeping you informed and prepared for any conditions, wherever you are.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.maxFinite,
                    child: GestureDetector(
                      onTap: () {
                        skipButtonPressed(true);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Skip",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
    navigateToHomePage();
  }

  Future<void> checkSkipStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool skip = sp.getBool("skip") ?? false;
    if (skip) {
      navigateToHomePage();
    } else {
      _timer = Timer(const Duration(seconds: 5), navigateToHomePage);
    }
  }

  void navigateToHomePage() {
    if (mounted) {
      // Check if the widget is still mounted before calling setState
      setState(() {
        GoRouter.of(context).pushReplacementNamed(
          MyAppRouteConstants.homePage,
        );
      });
    }
  }
}
