import '../../model/ride_pref/ride_pref.dart';
import '../../data/dummy_data.dart';
import 'ride_preference_repository.dart';

class MockRidePreferenceRepository extends RidePreferenceRepository {
  final List<RidePreference> _history = [...fakeRidePrefs];

  @override
  List<RidePreference> getHistory() {
    return _history;
  }

  @override
  void addPreference(RidePreference preference) {
    _history.add(preference);
  }
}
