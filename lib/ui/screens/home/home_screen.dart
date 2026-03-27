import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/animations_util.dart';
import '../../states/ride_preferences_state.dart';
import '../../theme/theme.dart';
import '../../widgets/pickers/bla_ride_preference_picker.dart';
import '../rides_selection/rides_selection_screen.dart';
import 'widgets/home_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onRidePrefSelected(RidePreference selectedPreference) async {
    // 1- Ask the state to update the current preference
    context.read<RidePreferenceState>().selectPreference(selectedPreference);

    // 2 - Navigate to the rides screen
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()));
  }

  @override
  Widget build(context) {
    return Stack(children: [_buildBackground(), _buildForeground()]);
  }

  Widget _buildForeground() {
    final ridePreferenceState = context.watch<RidePreferenceState>();

    return Column(
      children: [
        // 1 - THE HEADER
        const SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 100),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2 - THE FORM
              BlaRidePreferencePicker(
                initRidePreference: ridePreferenceState.selectedPreference,
                onRidePreferenceSelected: onRidePrefSelected,
              ),
              const SizedBox(height: BlaSpacings.m),

              // 3 - THE HISTORY
              _buildHistory(ridePreferenceState.preferenceHistory),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(List<RidePreference> history) {
    // Reverse the history of preferences
    List<RidePreference> reversedHistory = history.reversed.toList();

    return SizedBox(
      height: 200, // Set a fixed height
      child: ListView.builder(
        shrinkWrap: true, // Fix ListView height issue
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: reversedHistory.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: reversedHistory[index],
          onPressed: () => onRidePrefSelected(reversedHistory[index]),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}
