import '../../model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  List<RidePreference> getHistory();
  void addPreference(RidePreference preference);
}
