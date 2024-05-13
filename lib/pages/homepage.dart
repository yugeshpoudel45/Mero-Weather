import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_weather/config/cached_network_image.dart';
import 'package:mero_weather/config/convert_lat_to_address.dart';
import 'package:mero_weather/cubit/weather_details_cubit.dart';
import 'package:mero_weather/routes/app_route_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;

  double lat = 0.0;
  double long = 0.0;
  String locationName = '';
  String savedLocation = '';

  @override
  void initState() {
    _searchController = TextEditingController();
    _loadStoredLocation();
    Future.delayed(const Duration(seconds: 2), () {
      savedLocation.isEmpty ? _getCurrentLocation() : _loadWithSavedLocation();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme myColorScheme = Theme.of(context).colorScheme;
    Size mySize = MediaQuery.sizeOf(context);
    TextTheme myTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<WeatherDetailsCubit, WeatherDetailsState>(
        builder: (context, state) {
          if (state is WeatherDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherDetailsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is WeatherDetailsLoadedState) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF87CEEB), Color(0xFF4682B4)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: mySize.height / 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: myTextTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                "${state.weatherDetailsModel.location!.name}, ${state.weatherDetailsModel.location!.country!}"),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.help),
                          onPressed: () {
                            GoRouter.of(context).pushReplacementNamed(
                              MyAppRouteConstants.helpScreen,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: mySize.height / 40),
                    CupertinoSearchTextField(
                      placeholder: "Enter Location",
                      // autofocus: true,
                      controller: _searchController,
                      prefixInsets: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: myColorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                      onSuffixTap: () {
                        _searchController.clear();
                      },
                    ),
                    SizedBox(height: mySize.height / 80),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          _saveLocation(_searchController.text);
                          setState(() {
                            locationName = _searchController.text;
                          });
                          fetchWeatherDetails();
                        },
                        child: Text(savedLocation.isEmpty ? 'Save' : 'Update'),
                      ),
                    ),
                    AppNetworkImage(
                      image:
                          state.weatherDetailsModel.current!.condition!.icon!,
                    ),
                    Text(
                      "${state.weatherDetailsModel.current!.tempC}°C",
                      style: TextStyle(
                        fontSize: 64,
                        color: myColorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'CLOUDY',
                      style: myTextTheme.titleLarge!.copyWith(
                        color: myColorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: mySize.height / 40),
                    Text(
                      '7 - Day Forecast',
                      style: myTextTheme.titleLarge!.copyWith(
                        color: myColorScheme.onPrimary,
                        fontFamily: GoogleFonts.balsamiqSans().fontFamily!,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(4),
                        itemCount: state
                            .weatherDetailsModel.forecast!.forecastday!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: mySize.width / 4,
                                child: Text(
                                  "${state.weatherDetailsModel.forecast!.forecastday![index].date!.year}-${state.weatherDetailsModel.forecast!.forecastday![index].date!.month}-${state.weatherDetailsModel.forecast!.forecastday![index].date!.day}",
                                  style: myTextTheme.titleMedium!.copyWith(
                                    color: myColorScheme.onPrimary,
                                  ),
                                ),
                              ),
                              SizedBox(width: mySize.width / 12),
                              AppNetworkImage(
                                image: state.weatherDetailsModel.forecast!
                                    .forecastday![index].day!.condition!.icon!,
                                height: 32,
                              ),
                              SizedBox(width: mySize.width / 12),
                              Text(
                                "${state.weatherDetailsModel.forecast!.forecastday![index].day!.avgtempC}°C",
                                style: myTextTheme.titleMedium!.copyWith(
                                  color: myColorScheme.onPrimary,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrentLocation();
        },
        child: const Icon(Icons.gps_fixed_rounded),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      if (permission == LocationPermission.denied) {
        final permissionStatus = await Geolocator.requestPermission();
        if (permissionStatus != LocationPermission.whileInUse &&
            permissionStatus != LocationPermission.always) {
          throw Exception(
              'Location permissions are denied (actual value: $permissionStatus).');
        }
      }
      Position position = await Geolocator.getCurrentPosition();
      lat = position.latitude;
      long = position.longitude;
      locationName = await convertLatitudeToAddress(lat, long);
      setState(() {});
      fetchWeatherDetails();
    } catch (e) {
      log("Exception caught: $e");
    }
  }

  void _loadWithSavedLocation() {
    if (savedLocation.isNotEmpty) {
      setState(() {
        locationName = savedLocation;
      });
      fetchWeatherDetails();
    }
  }

  void fetchWeatherDetails() {
    context.read<WeatherDetailsCubit>().onFetchWeatherDetails(
          locationName.isEmpty ? 'Bhaktapur' : locationName,
        );
  }

//-----------------------------Shared Preferences Section--------------------------------
  Future<void> _saveLocation(String locationName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("location", locationName);
  }

  Future<void> _loadStoredLocation() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? location = sp.getString("location");
    if (location != null) {
      setState(() {
        savedLocation = location;
      });
    }
  }
}
