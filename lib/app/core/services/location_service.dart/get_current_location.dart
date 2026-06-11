import 'package:geolocator/geolocator.dart';

class LocationService {
  
static Future<Position> getCurrentLocation() async {

  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
  }

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.deniedForever) {
    await Geolocator.openAppSettings();
    throw Exception("Location permissions are permanently denied.");
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    

    if (permission == LocationPermission.denied) {
      throw Exception("Location permissions are denied.");
    }
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}


}
