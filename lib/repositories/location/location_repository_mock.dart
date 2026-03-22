import '../../model/ride/locations.dart';
import '../../data/dummy_data.dart';
import 'location_repository.dart';

class MockLocationRepository extends LocationRepository {
  @override
  List<Location> getLocations() {
    return fakeLocations;
  }
}
