// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:mero_weather/cubit/weather_details_cubit.dart';

// class HelpScreen extends StatefulWidget {
//   const HelpScreen({super.key});

//   @override
//   HelpScreenState createState() => HelpScreenState();
// }

// class HelpScreenState extends State<HelpScreen> {
//   final TextEditingController _locationController = TextEditingController();
//   final String _locationName = '';
//   String? _temperature = '';

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _loadSavedLocation();
//   // }

//   // void _loadSavedLocation() async {
//   //   // Retrieve saved location name from storage (e.g., SharedPreferences)
//   //   // Here, I'm using a dummy value
//   //   String savedLocation = 'New York';
//   //   if (savedLocation.isNotEmpty) {
//   //     setState(() {
//   //       _locationName = savedLocation;
//   //     });
//   //     await _fetchWeather();
//   //   } else {
//   //     // Fetch weather using current location
//   //     await _fetchWeatherWithLocation();
//   //   }
//   // }

//   // Future<void> _fetchWeatherWithLocation() async {
//   //   // Fetch weather using current latitude and longitude
//   //   // Implement your weather API logic here
//   //   // Dummy temperature value
//   //   setState(() {
//   //     _temperature = '25°C';
//   //   });
//   // }

//   // Future<void> _fetchWeather() async {
//   //   // Fetch weather using location name
//   //   // Implement your weather API logic here
//   //   // Dummy temperature value
//   //   setState(() {
//   //     _temperature = '20°C';
//   //   });
//   // }

//   // void _saveLocation() {
//   //   String enteredLocation = _locationController.text.trim();
//   //   if (enteredLocation.isNotEmpty) {
//   //     setState(() {
//   //       _locationName = enteredLocation;
//   //     });
//   //     // Save location name to storage (e.g., SharedPreferences)
//   //     // Here, I'm just updating a variable
//   //     _locationController.clear();
//   //     _fetchWeather();
//   //   }
//   // }
//   @override
//   void initState() {
//     super.initState();
//     context.read<WeatherDetailsCubit>().onFetchWeatherDetails(
//           _locationName.isEmpty ? 'New York' : _locationName,
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WeatherDetailsCubit, WeatherDetailsState>(
//       builder: (context, state) {
//         if (state is WeatherDetailsLoadingState) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is WeatherDetailsErrorState) {
//           return Center(
//             child: Text(state.errorMessage),
//           );
//         } else if (state is WeatherDetailsLoadedState) {
//           _temperature = state.weatherDetailsModel.location!.country;
//         }
//         return Scaffold(
//           // appBar: AppBar(
//           //   title: const Text('HomePage'),
//           //   actions: [
//           //     IconButton(
//           //       icon: const Icon(Icons.help),
//           //       onPressed: () {},
//           //     ),
//           //   ],
//           // ),
//           body: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Color(0xFF87CEEB), Color(0xFF4682B4)],
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 20.0),
//                   Text(
//                     'Location: $_temperature',
//                     style: const TextStyle(fontSize: 20.0),
//                   ),
//                   const SizedBox(height: 20.0),
//                   TextField(
//                     controller: _locationController,
//                     decoration: const InputDecoration(
//                       labelText: 'Enter Location',
//                     ),
//                   ),
//                   const SizedBox(height: 20.0),
//                   // ElevatedButton(
//                   //   onPressed: _saveLocation,
//                   //   child: Text(_locationName.isEmpty ? 'Save' : 'Update'),
//                   // ),
//                   const SizedBox(height: 20.0),
//                   Text(
//                     'Temperature: $_temperature',
//                     style: const TextStyle(fontSize: 20.0),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
