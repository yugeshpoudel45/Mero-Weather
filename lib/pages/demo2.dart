import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme myColorScheme = Theme.of(context).colorScheme;
    Size mySize = MediaQuery.sizeOf(context);

    TextTheme myTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
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
                      const Text(
                        'Kathmandu, Nepal',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   icon: const Icon(Icons.search),
                      //   onPressed: () {
                      //     // Navigator.pop(context);
                      //   },
                      // ),
                      IconButton(
                        icon: const Icon(Icons.help),
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const TextField(
                // controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Enter Location',
                ),
              ),
              SizedBox(height: mySize.height / 80),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  // onPressed: _saveLocation,
                  // child: Text(_locationName.isEmpty ? 'Save' : 'Update'),
                  child: const Text('Save'),
                ),
              ),
              Icon(
                Icons.cloud,
                size: 100,
                color: myColorScheme.onPrimary,
              ),
              Text(
                '  25°',
                style: myTextTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 96,
                  color: myColorScheme.onPrimary,
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
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: mySize.width / 4,
                          child: Text(
                            "Wednesday",
                            style: myTextTheme.titleMedium!.copyWith(
                              color: myColorScheme.onPrimary,
                            ),
                          ),
                        ),
                        SizedBox(width: mySize.width / 12),
                        Icon(
                          Icons.cloud,
                          color: myColorScheme.onPrimary,
                        ),
                        SizedBox(width: mySize.width / 8),
                        Text(
                          "25°",
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
      ),
    );
  }
}
