import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories/location/location_repository.dart';
import 'repositories/ride/ride_repository.dart';
import 'repositories/ride_preference/ride_preference_repository.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/states/ride_preferences_state.dart';
import 'ui/theme/theme.dart';

void mainCommon({
  required LocationRepository locationsRepository,
  required RideRepository ridesRepository,
  required RidePreferenceRepository ridePreferenceRepository,
}) {
  runApp(
    MultiProvider(
      providers: [
        Provider<LocationRepository>.value(value: locationsRepository),
        Provider<RideRepository>.value(value: ridesRepository),
        Provider<RidePreferenceRepository>.value(value: ridePreferenceRepository),
        ChangeNotifierProvider<RidePreferenceState>(
          create: (context) => RidePreferenceState(ridePreferenceRepository),
        ),
      ],
      child: const BlaBlaApp(),
    ),
  );
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: const HomeScreen(),
    );
  }
}
