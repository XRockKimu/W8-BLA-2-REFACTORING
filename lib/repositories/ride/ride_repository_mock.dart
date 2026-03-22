import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../data/dummy_data.dart';
import 'ride_repository.dart';

class MockRideRepository extends RideRepository {
  @override
  List<Ride> getRides(RidePreference preference) {
    return fakeRides.where((ride) =>
        ride.departureLocation == preference.departure &&
        ride.arrivalLocation == preference.arrival &&
        ride.availableSeats >= preference.requestedSeats).toList();
  }
}
