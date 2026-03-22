import 'main_common.dart';
import 'repositories/location/location_repository_mock.dart';
import 'repositories/ride/ride_repository_mock.dart';
import 'repositories/ride_preference/ride_preference_repository_mock.dart';

void main() {
  mainCommon(
    locationsRepository: MockLocationRepository(),
    ridesRepository: MockRideRepository(),
    ridePreferenceRepository: MockRidePreferenceRepository(),
  );
}
